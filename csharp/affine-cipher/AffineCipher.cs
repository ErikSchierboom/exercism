using System;
using System.Collections.Generic;
using System.Linq;

public static class AffineCipher
{
    private const string Alphabet = "abcdefghijklmnopqrstuvwxyz";
    private const int ChunkSize = 5;

    public static string Encode(string plainText, int a, int b)
    {
        if (!Math.Coprime(a, Alphabet.Length)) throw new ArgumentException(nameof(a));

        return plainText.Translate(i => a * i + b).Chunk();
    }

    public static string Decode(string cipherText, int a, int b)
    {
        if (!Math.Coprime(a, Alphabet.Length)) throw new ArgumentException(nameof(a));

        var modularInverse = Math.ModularInverse(a, Alphabet.Length);

        return cipherText.Translate(i => modularInverse * (i - b));
    }

    private static string Translate(this string str, Func<int, int> mapIndex) =>
        new(str.Where(char.IsLetterOrDigit).Select(c => c.Translate(mapIndex)).ToArray());

    private static char Translate(this char c, Func<int, int> mapIndex)
    {
        var index = Alphabet.IndexOf(char.ToLower(c));
        return index == -1 ? c : Alphabet[Math.Mod(mapIndex(index), Alphabet.Length)];
    }

    private static string Chunk(this string encodedLetters) =>
        string.Join(" ", encodedLetters.Chunks(ChunkSize));

    private static IEnumerable<string> Chunks(this string str, int size)
    {
        for (var i = 0; i < str.Length; i += size)
            yield return str.Substring(i, System.Math.Min(size, str.Length - i));
    }
}

public static class Math
{
    public static bool Coprime(int a, int m) => Gcd(a, m) == 1;

    private static int Gcd(int a, int m) => a == 0 ? m : Gcd(m % a, a);
    
    public static int Mod(int a, int m) => (a % m + m) % m;

    public static int ModularInverse(int a, int m)
    {
        if (m == 1)
            return 0;

        var m0 = m;
        var (x, y) = (1, 0);
 
        while (a > 1)
        {
            var q = a / m;
            (a, m) = (m, a % m);
            (x, y) = (y, x - q * y);
        }

        return x < 0 ? x + m0 : x;
    }
}