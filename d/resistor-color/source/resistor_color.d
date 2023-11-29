module resistor_color;

import std.algorithm.searching : countUntil;
import std.conv : to;

class ResistorColor
{
    static immutable string[] colors = [
        "black", "brown", "red", "orange", "yellow", "green", "blue",
        "violet", "grey", "white"
    ];

    static int colorCode(string color)
    {
        return colors.countUntil(color).to!int;
    }
}

unittest
{
    immutable int allTestsEnabled = 1;

    // Black
    assert(ResistorColor.colorCode("black") == 0);

    static if (allTestsEnabled)
    {
        // White
        assert(ResistorColor.colorCode("white") == 9);

        // Orange
        assert(ResistorColor.colorCode("orange") == 3);

        // Colors
        assert(ResistorColor.colors == [
                "black", "brown", "red", "orange", "yellow", "green", "blue",
                "violet", "grey", "white"
            ]);
    }

}
