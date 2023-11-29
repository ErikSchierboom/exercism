module robot;

import std.regex;
import std.stdio;
import std.ascii : uppercase, digits;
import std.conv : text;
import std.random : Random, rndGen, uniform, unpredictableSeed, choice;

class Robot
{
    string name;
    static int collisons;

    this()
    {
        name = generateName();
    }

    static string generateName()
    {
        auto rng = Random(unpredictableSeed);
        return [
            uppercase[uniform(0, 26, rng)],
            uppercase[uniform(0, 26, rng)],
            digits[uniform(0, 10, rng)],
            digits[uniform(0, 10, rng)],
            digits[uniform(0, 10, rng)]
        ];
    }

    void reset()
    {
        name = generateName();
    }
}

unittest
{

    // test for properly formatted name
    {
        auto pattern = regex(`^[A-Z]{2}\d{3}`);
        auto theRobot = new Robot();

        // test the regex pattern
        assert(matchAll("VAV224", pattern).empty);
        assert(matchAll("V221", pattern).empty);
        assert(matchAll("190", pattern).empty);
        assert(matchAll("12345", pattern).empty);
        assert(matchAll("SB1", pattern).empty);
        assert(matchAll("TT", pattern).empty);

        writefln("Robot name: %s", theRobot.name);

        // test that the name respects the pattern
        // that is: "2 uppercase letters followed by 3 digits"
        assert(!matchAll(theRobot.name, pattern).empty);
    }

    immutable int allTestsEnabled = 1;

    static if (allTestsEnabled)
    {
        // test name stickiness
        {
            auto theRobot = new Robot();
            auto name = theRobot.name;

            writefln("Robot name: %s", theRobot.name);
            assert(name == theRobot.name);
        }

        // test different names for different Robots
        {
            auto erTwoDeeTwo = new Robot();
            auto beeBeeEight = new Robot();

            writefln("Robot name: %s", erTwoDeeTwo.name);
            writefln("Robot name: %s", beeBeeEight.name);
            assert(erTwoDeeTwo.name != beeBeeEight.name);
        }

        // test name reset
        {
            auto theRobot = new Robot();
            auto nameOne = theRobot.name;
            theRobot.reset();
            auto nameTwo = theRobot.name;

            writefln("Robot name: %s", nameOne);
            writefln("Robot name: %s", nameTwo);
            assert(nameOne != nameTwo);
        }

        // collision test
        {
            foreach (i; 1 .. 10000)
            {
                auto theRobot = new Robot();
            }

            writefln("Collisons: %s that is %s%%", Robot.collisons,
                (Robot.collisons / 10000.0f) * 100);
        }
    }

}
