namespace simple_cipher
{
    using System;
    using System.Linq;

    public class Cipher
    {
        private const string Letters = "abcdefghijklmnopqrstuvwxyz";
        private const int KeyLength = 100;

        private static readonly Random Random = new Random();

        public Cipher()
            : this(GenerateKey())
        {
        }

        public Cipher(string key)
        {
            if (IsInvalidKey(key))
            {
                throw new ArgumentException("Invalid key specified.", "key");
            }

            this.Key = key;
        }
        
        public string Key { get; private set; }

        public string Encode(string plainText)
        {
            return new string(plainText.Select(this.Encode).ToArray());
        }

        private char Encode(char c, int i)
        {
            return this.Shift(c, i, (character, shift) => character + shift);
        }

        public string Decode(string encryptedText)
        {
            return new string(encryptedText.Select(this.Decode).ToArray());
        }

        private char Decode(char c, int i)
        {
            return this.Shift(c, i, (character, shift) => character - shift);
        }

        private char Shift(char c, int i, Func<int, int, int> shiftCharacter)
        {
            return (char)('a' + this.GetCharacterShiftValue(c, i, shiftCharacter));
        }

        private int GetCharacterShiftValue(char c, int i, Func<int, int, int> shiftCharacter)
        {
            return Mod(shiftCharacter(NormalizeCharacter(c), this.GetShiftValue(i)), Letters.Length);
        }

        private static int NormalizeCharacter(char c)
        {
            return c - 'a';
        }

        private int GetShiftValue(int i)
        {
            return this.Key[i] % 'a';
        }

        private static int Mod(int x, int y)
        {
            return ((x % y) + y) % y;
        }

        private static string GenerateKey()
        {
            return new string(Enumerable.Repeat(Letters, KeyLength)
                .Select(s => s[Random.Next(s.Length)])
                .ToArray());
        }

        private static bool IsInvalidKey(string key)
        {
            return string.IsNullOrEmpty(key) || !key.All(c => Letters.Contains(c));
        }
    }
}