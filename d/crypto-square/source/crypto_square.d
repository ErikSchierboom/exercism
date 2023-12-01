module crypto;

import std.string;
import std.array;
import std.math : sqrt, floor, ceil;
import std.conv : to;

import std.stdio;
import std.algorithm : map, filter, min;
import std.ascii : isAlphaNum;

class Cipher
{
    const string plaintext;

    this(const string plaintext)
    {
        this.plaintext = plaintext;
    }

    string normalizePlainText()
    {
        return plaintext.filter!isAlphaNum.map!toLower.to!string;
    }

    int size()
    {
        return normalizePlainText().length.to!float.sqrt.ceil.to!int;
    }

    string[] plainTextSegments()
    {
        string[] segments;
        auto normalizedPlaintext = normalizePlainText();
        auto size = size();
        
        for (int i = 0; i < normalizedPlaintext.length; i += size)
            segments ~= normalizedPlaintext[i..min(i + size, normalizedPlaintext.length)].to!string;

        return segments;
    }

    Cipher normalize()
    {
        delimiter = " ";

        return this;
    }

    string cipherText()
    {
        string result;
        
        for (int i = 0; i < size(); ++i)
        {
            string segment;
            foreach (s; plainTextSegments())
            {
                if (i < s.length)
                    segment ~= s[i];
            }

            result ~= segment;
            result ~= delimiter;
        }

        return result.strip;

    }

    string delimiter = "";
}

unittest
{
    immutable int allTestsEnabled = 1;

    // normalize_strange_characters
    {
        auto theCipher = new Cipher("s#$%^&plunk");
        assert("splunk" == theCipher.normalizePlainText());
    }

    static if (allTestsEnabled)
    {
        // normalize_numbers
        {
            auto theCipher = new Cipher("1, 2, 3 GO!");
            assert("123go" == theCipher.normalizePlainText());
        }

        // size_of_small_square
        {
            auto theCipher = new Cipher("1234");
            assert(2U == theCipher.size());
        }

        // size_of_slightly_larger_square
        {
            auto theCipher = new Cipher("123456789");
            assert(3U == theCipher.size());
        }

        // size_of_non_perfect_square
        {
            auto theCipher = new Cipher("123456789abc");
            assert(4U == theCipher.size());
        }

        // size_of_non_perfect_square_less
        {
            auto theCipher = new Cipher("zomgzombies");
            assert(4U == theCipher.size());
        }

        // plain_text_segments_from_phrase
        {
            const string[] expected = [
                "neverv", "exthin", "eheart", "withid", "lewoes"
            ];
            auto theCipher = new Cipher("Never vex thine heart with idle woes");
            const auto actual = theCipher.plainTextSegments();

            assert(expected == actual);
        }

        // plain_text_segments_from_complex_phrase
        {
            const string[] expected = ["zomg", "zomb", "ies"];
            auto theCipher = new Cipher("ZOMG! ZOMBIES!!!");
            const auto actual = theCipher.plainTextSegments();

            assert(expected == actual);
        }

        // Cipher_text_short_phrase
        {
            auto theCipher = new Cipher("Time is an illusion. Lunchtime doubly so.");
            assert("tasneyinicdsmiohooelntuillibsuuml" == theCipher.cipherText());
        }

        // Cipher_text_long_phrase
        {
            auto theCipher = new Cipher("We all know interspecies romance is weird.");
            assert("wneiaweoreneawssciliprerlneoidktcms" == theCipher.cipherText());
        }

        // normalized_Cipher_text1
        {
            auto theCipher = new Cipher("Madness, and then illumination.");
            assert("msemo aanin dnin ndla etlt shui" == theCipher.normalize.cipherText());
        }

        // normalized_Cipher_text2
        {
            auto theCipher = new Cipher("Vampires are people too!");
            assert("vrel aepe mset paoo irpo" == theCipher.normalize.cipherText());
        }
    }

}
