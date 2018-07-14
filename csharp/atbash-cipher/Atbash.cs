namespace atbash_cipher
{
    using System.Collections.Generic;
    using System.Linq;

    public static class Atbash
    {
        private const int BlockSize = 5;
        private const int MinLetterValue = 'a';
        private const int MaxLetterValue = 'z';

        public static string Encode(string words)
        {
            return string.Join(" ", EncodeInBlocks(GetEncodedCharacters(words)));
        }

        private static IEnumerable<char> GetEncodedCharacters(string words)
        {
            return GetValidCharacters(words).Select(Encode);
        }

        private static IEnumerable<char> GetValidCharacters(string words)
        {
            return words.ToLowerInvariant().Where(char.IsLetterOrDigit);
        }

        private static char Encode(char c)
        {
            if (char.IsDigit(c))
            {
                return c;
            }

            return (char)(MinLetterValue + (MaxLetterValue - c));
        }

        private static IEnumerable<string> EncodeInBlocks(IEnumerable<char> value)
        {
            for (var i = 0; i < value.Count(); i += BlockSize)
            {
                yield return new string(value.Skip(i).Take(BlockSize).ToArray());
            }
        }
    }
}