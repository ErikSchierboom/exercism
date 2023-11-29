module resistor_color_duo;

import std.algorithm.searching : countUntil;
import std.conv : to;

class ResistorColorDuo
{
    static immutable string[] colors = [
        "black", "brown", "red", "orange", "yellow", "green", "blue",
        "violet", "grey", "white"
    ];

    static int colorCode(string color)
    {
        return colors.countUntil(color).to!int;
    }

    static int value(string[] parts)
    {
        return colorCode(parts[0]) * 10 + colorCode(parts[1]);
    }
}

unittest
{
    immutable int allTestsEnabled = 1;

    // Brown and black
    assert(ResistorColorDuo.value(["brown", "black"]) == 10);

    static if (allTestsEnabled)
    {
        // Blue and grey
        assert(ResistorColorDuo.value(["blue", "grey"]) == 68);

        // Yellow and violet
        assert(ResistorColorDuo.value(["yellow", "violet"]) == 47);

        // Orange and orange
        assert(ResistorColorDuo.value(["orange", "orange"]) == 33);

        // Ignore additional colors
        assert(ResistorColorDuo.value(["green", "brown", "orange"]) == 51);
    }

}
