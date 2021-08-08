using System;
using System.Collections.Generic;
using System.Linq;

public static class AtbashCipher
{
    private const string Letters = "abcdefghijklmnopqrstuvwxyz";
    private static readonly Dictionary<char, char> EncodingMap = Letters.Zip(Letters.Reverse()).ToDictionary();

    public static string Encode(string plaintext) =>
        plaintext.ToLower()
            .Where(char.IsLetterOrDigit)
            .Chunk(5)
            .Select(chunk => chunk.Select(Encode).Join())
            .Join();

    public static string Decode(string ciphertext) =>
        Encode(ciphertext).Where(char.IsLetterOrDigit).Join();

    private static char Encode(char c) => EncodingMap.GetValueOrDefault(c, c);

    private static IEnumerable<string> Chunk(this IEnumerable<char> chars, int size)
    {
        var str = chars.Join();

        for (var i = 0; i < str.Length; i += size)
            yield return str.Substring(i, Math.Min(size, str.Length - i));
    }

    private static string Join(this IEnumerable<char> chars) => new(chars.ToArray());

    private static string Join(this IEnumerable<string> strings) => string.Join(" ", strings);
    
    private static Dictionary<TKey, TValue> ToDictionary<TKey, TValue>(this IEnumerable<(TKey, TValue)> pairs) =>
        pairs.ToDictionary(x => x.Item1, x => x.Item2);
}