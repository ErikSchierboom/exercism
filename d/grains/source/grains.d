module grains;

import std.exception : enforce;

ulong square(int n)
{
    enforce(n >= 1 && n <= 64, "Number must be between 1 and 64");

    return 1uL << (n - 1);
}

ulong total()
{
    return ulong.max;
}

unittest
{
    import std.exception : assertThrown;

    // Returns the number of grains on the square
    assert(square(1) == 1);

    assert(square(2) == 2);
    assert(square(3) == 4);
    assert(square(4) == 8);
    assert(square(16) == 32_768);
    assert(square(32) == 2_147_483_648uL);
    assert(square(64) == 9_223_372_036_854_775_808uL);

    // Square 0 raises an exception
    assertThrown(square(0));

    // Negative square raises an exception
    assertThrown(square(-1));

    // Square greater than 64 raises an exception
    assertThrown(square(65));

    // Returns the total number of grains on the board
    assert(total() == 18_446_744_073_709_551_615uL);
}
