using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;

public static class AffineCipher
{
    private const string Alphabet = "abcdefghijklmnopqrstuvwxyz";
    private const int ChunkSize = 5;

    public static string Encode(string plainText, int a, int b)
    {
        if (!Coprime(a, Alphabet.Length))
            throw new ArgumentException();

        bool ShouldEncode(char c) => char.IsLetterOrDigit(c);
        char Encode(char c) => char.IsDigit(c) ? c : IndexToChar(a * CharToIndex(c) + b);

        return plainText
            .Where(ShouldEncode)
            .Select(Encode)
            .Chunk();
    }

    private static int CharToIndex(char c) => Alphabet.IndexOf(char.ToLower(c));
    
    private static char IndexToChar(int i) => Alphabet[Mod(i, Alphabet.Length)];

    private static string Chunk(this IEnumerable<char> encodedLetters) 
        => string.Join(" ", encodedLetters.Chunks(ChunkSize).Select(chunk => new string(chunk.ToArray())));

    private static IEnumerable<IEnumerable<T>> Chunks<T>(this IEnumerable<T> source, int size)
    {
        while (source.Any())
        {
            yield return source.Take(size);
            source = source.Skip(size);
        }
    }

    public static string Decode(string cipheredText, int a, int b)
    {
        if (!Coprime(a, Alphabet.Length))
            throw new ArgumentException();

        var modularInverse = ModularInverse(a, Alphabet.Length);

        bool ShouldDecode(char c) => char.IsLetterOrDigit(c);
        char Decode(char c) => char.IsDigit(c) ? c : IndexToChar(modularInverse * (CharToIndex(c) - b));

        return new string(cipheredText.Where(ShouldDecode).Select(Decode).ToArray());
    }

    private static bool Coprime(int a, int m) => Gcd(a, m) == 1;

    private static int Gcd(int a, int m) => a == 0 ? m : Gcd(m % a, a);
    
    private static int Mod(int a, int m) => (a % m + m) % m;

    private static int ModularInverse(int a, int m)
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
