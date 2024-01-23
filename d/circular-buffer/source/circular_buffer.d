module circular;

import std.exception : enforce;
import std.range : popFront;
import std.algorithm;

class Buffer(T)
{
    private int capacity;
    private T[] items;

    this(int capacity)
    {
        this.capacity = capacity;
    }

    T pop()
    {
        enforce(items.length > 0);

        T oldest = items[0];
        items.popFront();
        return oldest;
    }

    void push(T value)
    {
        enforce(items.length < capacity);

        items ~= value;
    }

    void forcePush(T value)
    {
        if (items.length == capacity)
            pop();

        push(value);
    }

    void clear()
    {
        items = [];
    }
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 1;

    // Reading empty buffer should fail"
    {
        auto myBuffer = new Buffer!(int)(1UL);
        assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
    }

    static if (allTestsEnabled)
    {

        // Can read an item just written
        {
            auto myBuffer = new Buffer!(char)(1);
            myBuffer.push('1');
            assert(myBuffer.pop() == '1');
        }

        // Each item may only be read once"
        {
            auto myBuffer = new Buffer!(char)(1);
            myBuffer.push('1');
            assert(myBuffer.pop() == '1');
            assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
        }

        // Items are read in the order they are written
        {
            auto myBuffer = new Buffer!(char)(2);
            myBuffer.push('1');
            myBuffer.push('2');
            assert(myBuffer.pop() == '1');
            assert(myBuffer.pop() == '2');
        }

        // Full buffer can't be written to
        {
            auto myBuffer = new Buffer!(char)(1);
            myBuffer.push('1');
            assertThrown(myBuffer.push('2'),
                "Full buffer should throw exception if new element pushed!");
        }

        // A read frees up capacity for another write
        {
            auto myBuffer = new Buffer!(char)(1);
            myBuffer.push('1');
            assert(myBuffer.pop() == '1');
            myBuffer.push('2');
            assert(myBuffer.pop() == '2');
        }

        // Read position is maintained even across multiple writes
        {
            auto myBuffer = new Buffer!(char)(3);
            myBuffer.push('1');
            myBuffer.push('2');
            assert(myBuffer.pop() == '1');
            myBuffer.push('3');
            assert(myBuffer.pop() == '2');
            assert(myBuffer.pop() == '3');
        }

        // Items cleared out of buffer can't be read
        {
            auto myBuffer = new Buffer!(char)(1);
            myBuffer.push('1');
            myBuffer.clear();
            assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
        }

        // Clear frees up capacity for another write
        {
            auto myBuffer = new Buffer!(char)(1);
            myBuffer.push('1');
            myBuffer.clear();
            myBuffer.push('2');
            assert(myBuffer.pop() == '2');
        }

        // Clear does nothing on empty buffer
        {
            auto myBuffer = new Buffer!(char)(1);
            myBuffer.clear();
            myBuffer.push('1');
            assert(myBuffer.pop() == '1');
        }

        // Overwrite acts like write on non-full buffer
        {
            auto myBuffer = new Buffer!(char)(2);
            myBuffer.push('1');
            myBuffer.forcePush('2');
            assert(myBuffer.pop() == '1');
            assert(myBuffer.pop() == '2');
        }

        // Overwrite replaces the oldest item on full buffer
        {
            auto myBuffer = new Buffer!(char)(2);
            myBuffer.push('1');
            myBuffer.push('2');
            myBuffer.forcePush('3');
            assert(myBuffer.pop() == '2');
            assert(myBuffer.pop() == '3');
        }

        // Overwrite replaces the oldest item remaining in buffer following a read
        {
            auto myBuffer = new Buffer!(char)(3);
            myBuffer.push('1');
            myBuffer.push('2');
            myBuffer.push('3');
            assert(myBuffer.pop() == '1');
            myBuffer.push('4');
            myBuffer.forcePush('5');
            assert(myBuffer.pop() == '3');
            assert(myBuffer.pop() == '4');
            assert(myBuffer.pop() == '5');
        }

        // Initial clear does not affect wrapping around
        {
            auto myBuffer = new Buffer!(char)(2);
            myBuffer.clear();
            myBuffer.push('1');
            myBuffer.push('2');
            myBuffer.forcePush('3');
            myBuffer.forcePush('4');
            assert(myBuffer.pop() == '3');
            assert(myBuffer.pop() == '4');
            assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
        }

    }

}
