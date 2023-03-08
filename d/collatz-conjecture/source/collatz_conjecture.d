module collatz_conjecture;

import std.exception : enforce;

@safe pure uint steps(int number)
{
    enforce(number > 0, "Number must be positive");

    uint numSteps = 0;

    while (number != 1)
    {
        number = number % 2 == 0 ? number / 2 : number * 3 + 1;
        numSteps++;
    }

    return numSteps;
}

unittest
{
    import std.exception : assertThrown;

    // Zero steps for one
    assert(steps(1) == 0);

    // Divide if even
    assert(steps(16) == 4);

    // Even and odd steps
    assert(steps(12) == 9);

    // Large number of even and odd steps
    assert(steps(1000000) == 152);

    // Zero is an error
    assertThrown(steps(0));

    // Negative value is an error
    assertThrown(steps(-15));
}
