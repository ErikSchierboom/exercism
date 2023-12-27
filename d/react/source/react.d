module react;

import std.array;
import std.stdio;
import std.algorithm.sorting : sort;

class Reactor(T)
{
    static next_id = 1;

    abstract class Cell
    {
        this()
        {
            id = next_id++;
        }

        int id;

    private:
        ComputeCell[] dependents()
        {
            bool[ComputeCell] all;

            foreach (dependent; m_dependents)
            {
                all[dependent] = true;

                foreach (sub_dep; dependent.dependents())
                    all[sub_dep] = true;
            }

            return all.keys.sort!(q{a.id < b.id}).array;
        }

        T m_value;
        ComputeCell[] m_dependents;
        void delegate(T)[int] m_callbacks;
        int m_callback_id;
    }

    class InputCell : Cell
    {
        this(T value)
        {
            m_value = value;
        }

        @property T value()
        {
            return m_value;
        }

        @property void value(T newValue)
        {
            if (newValue == m_value)
                return;

            m_value = newValue;

            bool[ComputeCell] changed;

            foreach (dependent; dependents())
                if (dependent.refresh())
                    changed[dependent] = true;

            foreach (dependent; changed.keys)
                dependent.callback();
        }
    }

    class ComputeCell : Cell
    {
        this(Cell dependency, T delegate(T) computation)
        {
            m_computation = () => computation(dependency.m_value);
            m_value = m_computation();
            dependency.m_dependents ~= this;
        }

        this(Cell dependency1, Cell dependency2, T delegate(T, T) computation)
        {
            m_computation = () => computation(dependency1.m_value, dependency2.m_value);
            m_value = m_computation();
            dependency1.m_dependents ~= this;
            dependency2.m_dependents ~= this;
        }

        @property T value()
        {
            return m_value;
        }

        bool refresh()
        {
            T newValue = m_computation();
            if (m_value == newValue)
                return false;

            m_value = newValue;
            return true;
        }

        void callback()
        {
            foreach (cb; m_callbacks)
                cb(m_value);
        }

        void delegate() addCallback(void delegate(T) callback)
        {
            auto id = m_callback_id++;
            m_callbacks[id] = callback;

            return () { m_callbacks.remove(id); };
        }

    private:
        T delegate() m_computation;
    }
}

unittest
{
    {
        // input cells have a value
        Reactor!(int) r;
        auto input = r.new InputCell(10);

        assert(input.value == 10);
    }
    {
        // an input cell's value can be set
        Reactor!(int) r;
        auto input = r.new InputCell(4);

        input.value = 20;
        assert(input.value == 20);
    }
    {
        // compute cells calculate initial value
        Reactor!(int) r;
        auto input = r.new InputCell(1);
        auto output = r.new ComputeCell(input, (int x) => x + 1);

        assert(output.value == 2);
    }
    {
        // compute cells take inputs in the right order
        Reactor!(int) r;
        auto one = r.new InputCell(1);
        auto two = r.new InputCell(2);
        auto output = r.new ComputeCell(one, two, (int x, int y) => x + y * 10);

        assert(output.value == 21);
    }
    {
        // compute cells update value when dependencies are changed
        Reactor!(int) r;
        auto input = r.new InputCell(1);
        auto output = r.new ComputeCell(input, (int x) => x + 1);

        input.value = 3;
        assert(output.value == 4);
    }
    {
        // compute cells can depend on other compute cells
        Reactor!(int) r;
        auto input = r.new InputCell(1);
        auto timesTwo = r.new ComputeCell(input, (int x) => x * 2);
        auto timesThirty = r.new ComputeCell(input, (int x) => x * 30);
        auto output = r.new ComputeCell(timesTwo, timesThirty, (int x, int y) => x + y);

        assert(output.value == 32);
        input.value = 3;
        assert(output.value == 96);
    }
    {
        // compute cells fire callbacks
        Reactor!(int) r;
        auto input = r.new InputCell(1);
        auto output = r.new ComputeCell(input, (int x) => x + 1);
        int[] vals;

        output.addCallback((int x) { vals ~= [x]; return; });

        input.value = 3;
        assert(vals.length == 1);
        assert(vals[0] == 4);
    }
    {
        // compute cells only fire on change
        Reactor!(int) r;
        auto input = r.new InputCell(1);
        auto output = r.new ComputeCell(input, (int x) => x < 3 ? 111 : 222);
        int[] vals;

        output.addCallback((int x) { vals ~= [x]; return; });

        input.value = 2;
        assert(vals.length == 0);
        input.value = 3;
        assert(vals.length == 1);
        assert(vals[0] == 222);
    }
    {
        // callbacks can be added and removed
        Reactor!(int) r;
        auto input = r.new InputCell(11);
        auto output = r.new ComputeCell(input, (int x) => x + 1);
        int[] vals1;
        int[] vals2;
        int[] vals3;

        void delegate() cancel1 = output.addCallback((int x) {
            vals1 ~= [x];
            return;
        });
        output.addCallback((int x) { vals2 ~= [x]; return; });

        input.value = 31;

        cancel1();
        output.addCallback((int x) { vals3 ~= [x]; return; });

        input.value = 41;

        assert(vals1.length == 1);
        assert(vals1[0] == 32);
        assert(vals2.length == 2);
        assert(vals2[0] == 32);
        assert(vals2[1] == 42);
        assert(vals3.length == 1);
        assert(vals3[0] == 42);
    }
    {
        // removing a callback multiple times doesn't interfere with other callbacks
        Reactor!(int) r;
        auto input = r.new InputCell(1);
        auto output = r.new ComputeCell(input, (int x) => x + 1);
        int[] vals1;
        int[] vals2;

        void delegate() cancel1 = output.addCallback((int x) {
            vals1 ~= [x];
            return;
        });
        output.addCallback((int x) { vals2 ~= [x]; return; });

        foreach (i; 0 .. 10)
        {
            cancel1();
        }

        input.value = 2;

        assert(vals1.length == 0);
        assert(vals2.length == 1);
        assert(vals2[0] == 3);
    }
    {
        // callbacks should only be called once even if multiple dependencies change
        Reactor!(int) r;
        auto input = r.new InputCell(1);
        auto plusOne = r.new ComputeCell(input, (int x) => x + 1);
        auto minusOne1 = r.new ComputeCell(input, (int x) => x - 1);
        auto minusOne2 = r.new ComputeCell(minusOne1, (int x) => x - 1);
        auto output = r.new ComputeCell(plusOne, minusOne2, (int x, int y) => x * y);
        int[] vals;

        output.addCallback((int x) { vals ~= [x]; return; });

        input.value = 4;

        assert(vals.length == 1);
        assert(vals[0] == 10);
    }
    {
        // callbacks should not be called if dependencies change but output value doesn't change
        Reactor!(int) r;
        auto input = r.new InputCell(1);
        auto plusOne = r.new ComputeCell(input, (int x) => x + 1);
        auto minusOne = r.new ComputeCell(input, (int x) => x - 1);
        auto alwaysTwo = r.new ComputeCell(plusOne, minusOne, (int x, int y) => x - y);
        int[] vals;

        alwaysTwo.addCallback((int x) { vals ~= [x]; return; });

        foreach (i; 0 .. 10)
        {
            input.value = i;
        }

        assert(vals.length == 0);
    }
    {
        // This is a digital logic circuit called an adder:
        // https://en.wikipedia.org/wiki/Adder_(electronics)
        Reactor!(bool) r;
        auto a = r.new InputCell(false);
        auto b = r.new InputCell(false);
        auto carryIn = r.new InputCell(false);

        auto aXorB = r.new ComputeCell(a, b, (bool x, bool y) => x != y);
        auto sum = r.new ComputeCell(aXorB, carryIn, (bool x, bool y) => x != y);

        auto aXorBAndCin = r.new ComputeCell(aXorB, carryIn, (bool x, bool y) => x && y);
        auto aAndB = r.new ComputeCell(a, b, (bool x, bool y) => x && y);
        auto carryOut = r.new ComputeCell(aXorBAndCin, aAndB, (bool x, bool y) => x || y);

        bool[5][] tests = [
            //            inputs,     expected
            //   a,     b,   cin,  cout,   sum
            [false, false, false, false, false],
            [false, false, true, false, true],
            [false, true, false, false, true], [
                false, true, true, true, false
            ], [true, false, false, false, true],
            [true, false, true, true, false], [
                true, true, false, true, false
            ], [true, true, true, true, true],
        ];

        foreach (test; tests)
        {
            a.value = test[0];
            b.value = test[1];
            carryIn.value = test[2];

            assert(carryOut.value == test[3]);
            assert(sum.value == test[4]);
        }
    }
}
