using System;
using System.Collections.Generic;
using System.Linq;

public static class CryptoSquare
{
    public static string Ciphertext(string plaintext) =>
        plaintext.Length == 0 ? string.Empty : string.Join(" ", plaintext.Normalized().Rows().Cols());

    private static string Normalized(this string str) =>
        new(str.ToLowerInvariant().Where(char.IsLetterOrDigit).ToArray());

    private static int Size(this string str) => (int)Math.Ceiling(Math.Sqrt(str.Length));

    private static string[] Rows(this string str)
    {
        var size = str.Size();
        return str.Chunks(size).Select(row => row.PadRight(size)).ToArray();
    }
    
    private static IEnumerable<string> Cols(this string[] rows) =>
        Enumerable.Range(0, rows[0].Length)
            .Select(i => new string(rows.Select(row => row[i]).ToArray()));

    private static IEnumerable<string> Chunks(this string str, int size)
    {
        for (var i = 0; i < str.Length; i += size)
            yield return str.Substring(i, Math.Min(str.Length - i, size));
    }
}