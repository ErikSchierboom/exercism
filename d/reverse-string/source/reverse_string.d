module reverse_string;

import std.algorithm : reverse;

string reverseString(string input)
{
    return input.dup.reverse.idup;
}

unittest
{
    // An empty string
    assert(reverseString("") == "");

    // A word
    assert(reverseString("robot") == "tobor");

    // A capitalized word
    assert(reverseString("Ramen") == "nemaR");

    // A sentence with punctuation
    assert(reverseString("I'm hungry!") == "!yrgnuh m'I");

    // A palindrome
    assert(reverseString("racecar") == "racecar");

    // An even-sized word
    assert(reverseString("drawer") == "reward");
}
