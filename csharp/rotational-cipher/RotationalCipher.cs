using System.Collections.Generic;
using System.Linq;

public static class RotationalCipher
{
    private const string Letters = "abcdefghijklmnopqrstuvwxyz";

    public static string Rotate(string plaintext, int rotation)
    {
        var rotatedLetters = Letters.Rotated(rotation).Concat(Letters.ToUpper().Rotated(rotation)).ToDictionary();
        return new string(plaintext.Select(c => rotatedLetters.GetValueOrDefault(c, c)).ToArray());
    }

    private static IEnumerable<(char From, char To)> Rotated(this string key, int rotation) =>
        key.Zip(key[rotation..] + key[..rotation]);
    
    private static Dictionary<TKey, TValue> ToDictionary<TKey, TValue>(this IEnumerable<(TKey From, TValue To)> keyValuePairs) =>
        keyValuePairs.ToDictionary(kv => kv.From, kv => kv.To);
}