module pangram;

import std.ascii : isLower, isUpper;
import std.bitmanip : BitArray;
import std.range : repeat;
import std.array : array;

bool isPangram(string sentence)
{
    BitArray letters = false.repeat(26).array;

    foreach (c; sentence)
    {
        if (c.isLower)
            letters[c - 'a'] = true;
        else if (c.isUpper)
            letters[c - 'A'] = true;
    }

    return letters.count == 26;
}

unittest
{
    // Empty sentence
    assert(!isPangram(""));

    // Perfect lower case
    assert(isPangram("abcdefghijklmnopqrstuvwxyz"));

    // Only lower case
    assert(!isPangram("the quick brown fish jumps over the lazy dog"));

    // Missing the letter 'x'
    assert(!isPangram("a quick movement of the enemy will jeopardize five gunboats"));

    // Missing the letter 'h'
    assert(!isPangram("five boxing wizards jump quickly at it"));

    // With underscores
    assert(isPangram("the_quick_brown_fox_jumps_over_the_lazy_dog"));

    // With numbers
    assert(isPangram("the 1 quick brown fox jumps over the 2 lazy dogs"));

    // Missing letters replaced by numbers
    assert(!isPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"));

    // Mixed case and punctuation
    assert(isPangram("\"Five quacking Zephyrs jolt my wax bed\""));

    // Case insensitive
    assert(!isPangram("the quick brown fox jumps over with lazy FX"));
}
