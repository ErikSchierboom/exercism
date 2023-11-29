module etl;

import std.array : array;
import std.algorithm.sorting : sort;
import std.algorithm.comparison : equal;
import std.ascii : toLower;

int[dchar] transform(immutable string[int] old)
{
    int[dchar] transformed;
    
    foreach (int score, string letters; old)
        foreach (dchar letter; letters)
            transformed[letter.toLower] = score;

    return transformed;
}

unittest
{

    // test associative array equality
    bool aaEqual(const int[dchar] lhs, const int[dchar] rhs)
    {
        auto lhsPairs = lhs.byKeyValue.array;
        auto rhsPairs = rhs.byKeyValue.array;
        lhsPairs.sort!(q{a.key < b.key});
        rhsPairs.sort!(q{a.key < b.key});

        return equal!("a.key == b.key && a.value == b.value")(lhsPairs, rhsPairs);
    }

    immutable int allTestsEnabled = 1;

    // Single letter
    {
        immutable string[int] old = [1 : "A"];

        const auto actual = transform(old);
        const int[dchar] expected = ['a' : 1];

        assert(aaEqual(expected, actual));
    }

    static if (allTestsEnabled)
    {
        // Single score with multiple letters
        {
            immutable string[int] old = [1 : "AEIOU"];

            const auto actual = transform(old);
            const int[dchar] expected = ['a' : 1, 'e' : 1, 'i' : 1, 'o' : 1, 'u' : 1];

            assert(aaEqual(expected, actual));
        }

        // Multiple scores with multiple letters
        {
            immutable string[int] old = [1 : "AE", 2 : "DG"];

            const auto actual = transform(old);
            const int[dchar] expected = ['a' : 1, 'e' : 1, 'd' : 2, 'g' : 2];

            assert(aaEqual(expected, actual));
        }

        // Multiple scores with differing numbers of letters
        {
            immutable string[int] old = [
                1 : "AEIOULNRST", 2 : "DG", 3 : "BCMP", 4 : "FHVWY", 5 : "K",
                8 : "JX", 10 : "QZ"
            ];

            const auto actual = transform(old);

            const int[dchar] expected = [
                'a' : 1, 'b' : 3, 'c' : 3, 'd' : 2, 'e' : 1, 'f' : 4, 'g' : 2,
                'h' : 4, 'i' : 1, 'j' : 8, 'k' : 5, 'l' : 1, 'm' : 3, 'n' : 1,
                'o' : 1, 'p' : 3, 'q' : 10, 'r' : 1, 's' : 1, 't' : 1, 'u' : 1,
                'v' : 4, 'w' : 4, 'x' : 8, 'y' : 4, 'z' : 10
            ];

            assert(aaEqual(expected, actual));
        }

    }

}
