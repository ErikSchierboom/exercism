module isogram;

import std.algorithm.iteration : filter, map;
import std.ascii : isAlpha, toLower;
import std.bitmanip : BitArray;
import std.range : repeat;
import std.array : array;

bool isIsogram(string sentence)
{
    BitArray letters = false.repeat(26).array;

    foreach (c; sentence.filter!isAlpha.map!toLower)
    {
        int bit = c - 'a';
        if (letters[bit])
            return false;
        
        letters[bit] = true;
    }

    return true;
}

unittest
{
    // Empty string
    assert(isIsogram(""));

    // Isogram with only lower case characters
    assert(isIsogram("isogram"));

    // Word with one duplicated character
    assert(!isIsogram("eleven"));

    // Word with one duplicated character from the end of the alphabet
    assert(!isIsogram("zzyzx"));

    // Longest reported english isogram
    assert(isIsogram("subdermatoglyphic"));

    // Word with duplicated character in mixed case
    assert(!isIsogram("Alphabet"));

    // Word with duplicated character in mixed case, lowercase first
    assert(!isIsogram("alphAbet"));

    // Hypothetical isogrammic word with hyphen
    assert(isIsogram("thumbscrew-japingly"));

    // Hypothetical word with duplicated character following hyphen
    assert(!isIsogram("thumbscrew-jappingly"));

    // Isogram with duplicated hyphen
    assert(isIsogram("six-year-old"));

    // Made-up name that is an isogram
    assert(isIsogram("Emily Jung Schwartzkopf"));

    // Duplicated character in the middle
    assert(!isIsogram("accentor"));

    // Same first and last characters
    assert(!isIsogram("angola"));
}
