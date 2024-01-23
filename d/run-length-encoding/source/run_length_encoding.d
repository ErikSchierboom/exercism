module run_length_encoding;

import std.regex : ctRegex, matchAll;
import std.conv : to;

auto encode_runs = ctRegex!(r"(.)\1*");
auto decode_runs = ctRegex!(r"(\d*)(.)");

string encode(string plaintext)
{
    string encoded;

    foreach (m; plaintext.matchAll(encode_runs))
    {
        if (m.hit.length > 1)
            encoded ~= m.hit.length.to!string;

        encoded ~= m.hit[0];
    }

    return encoded;
}

string decode(string ciphertext)
{
    string decoded;

    foreach (m; ciphertext.matchAll(decode_runs))
    {
        auto num_chars = m[1].length == 0 ? 1 : m[1].to!int;

        for (int i = 0; i < num_chars; i++)
            decoded ~= m[2][0];
    }

    return decoded;
}

unittest
{
    immutable int allTestsEnabled = 1;

    // Run-length encode a string

    // Empty string
    assert(encode("") == "");

    static if (allTestsEnabled)
    {
        // Single characters only are encoded without count
        assert(encode("XYZ") == "XYZ");

        // String with no single characters
        assert(encode("AABBBCCCC") == "2A3B4C");

        // Single characters mixed with repeated characters
        assert(encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB") == "12WB12W3B24WB");

        // Multiple whitespace mixed in string
        assert(encode("  hsqq qww  ") == "2 hs2q q2w2 ");

        // Lowercase characters
        assert(encode("aabbbcccc") == "2a3b4c");

        // Sun-length decode a string

        // Empty string
        assert(decode("") == "");

        // String with no single characters
        assert(decode("XYZ") == "XYZ");

        // Single characters with repeated characters
        assert(decode("2A3B4C") == "AABBBCCCC");

        // Multiple whitespace mixed in string
        assert(decode("12WB12W3B24WB") == "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB");

        // Multiple whitespace mixed in string
        assert(decode("2 hs2q q2w2 ") == "  hsqq qww  ");

        // Lower case string
        assert(decode("2a3b4c") == "aabbbcccc");

        // Encode and then decode

        // Encode followed by decode gives original string
        assert("zzz ZZ  zZ".encode.decode == "zzz ZZ  zZ");
    }
}
