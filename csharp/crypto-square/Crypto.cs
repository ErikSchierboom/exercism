namespace Exercism
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public class Crypto
    {
        public Crypto(string input)
        {
            this.NormalizePlaintext = GetNormalizedPlaintext(input);
            this.Size = this.CalculateSize();
        }

        public int Size { get; private set; }

        public string NormalizePlaintext { get; private set; }

        public string NormalizeCiphertext()
        {
            return string.Join(" ", Chunks(this.Ciphertext(), 5));
        }

        public string Ciphertext()
        {
            var cypherText = string.Empty;

            var plainTextSegments = this.PlaintextSegments().ToList();

            for (var x = 0; x < this.Size; x++)
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
            return Chunks(this.NormalizePlaintext, this.Size);
        }

        private int CalculateSize()
        {
            for (var i = 1; i < this.NormalizePlaintext.Length; i++)
            {
                if (i * i >= this.NormalizePlaintext.Length)
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
}