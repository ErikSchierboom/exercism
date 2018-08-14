using System;
using System.Collections.Generic;
using System.Linq;

public class Crypto
{
    public Crypto(string input)
    {
        NormalizePlaintext = GetNormalizedPlaintext(input);
        Size = CalculateSize();
    }

    public int Size { get; }

    public string NormalizePlaintext { get; }

    public string NormalizeCiphertext()
    {
        return string.Join(" ", Chunks(Ciphertext(), 5));
    }

    public string Ciphertext()
    {
        var cypherText = string.Empty;

        var plainTextSegments = PlaintextSegments().ToList();

        for (var x = 0; x < Size; x++)
        {
            for (var y = 0; y < plainTextSegments.Count; y++)
            {
                if (x < plainTextSegments[y].Length)
                {
                    cypherText += plainTextSegments[y][x];    
                }
            }
        }

        return cypherText;
    }

    public IEnumerable<string> PlaintextSegments()
    {
        return Chunks(NormalizePlaintext, Size);
    }

    private int CalculateSize()
    {
        for (var i = 1; i < NormalizePlaintext.Length; i++)
        {
            if (i * i >= NormalizePlaintext.Length)
            {
                return i;
            }
        }

        throw new InvalidOperationException("Could not calculate size");
    }

    private static string GetNormalizedPlaintext(string input)
    {
        return new string(input.ToLowerInvariant().Where(char.IsLetterOrDigit).ToArray());
    }

    private static IEnumerable<string> Chunks(string str, int chunkSize)
    {
        return Enumerable.Range(0, (int)Math.Ceiling(str.Length / (double)chunkSize))
                         .Select(i => str.Substring(i * chunkSize, Math.Min(str.Length - (i * chunkSize), chunkSize)));
    }
}