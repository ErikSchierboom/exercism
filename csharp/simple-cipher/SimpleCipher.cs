using System;
using System.Linq;

public class SimpleCipher
{
    private const string Alphabet = "abcdefghijklmnopqrstuvwxyz";
    private const int KeyLength = 100;

    public SimpleCipher(): this(GenerateKey())
    {
    }

    public SimpleCipher(string key)
    {
        if (!IsValidKey(key))
            throw new ArgumentException("Invalid key specified.", nameof(key));

        Key = key;
    }
    
    public string Key { get; }

    public string Encode(string plainText) => Shift(plainText, (x, y) => x + y);

    public string Decode(string encryptedText) => Shift(encryptedText, (x, y) => x - y);

    private string Shift(string text, Func<int, int, int> op) =>
        string.Join("", text.Select((c, i) =>
        {
            var alphabetIndex = Alphabet.IndexOf(c);
            var keyIndex = Alphabet.IndexOf(Key[Mod(i, Key.Length)]);
            return Alphabet[Mod(op(alphabetIndex, keyIndex), Alphabet.Length)];
        }));

    private static string GenerateKey() =>
        new(Enumerable.Repeat(Alphabet, KeyLength)
            .Select(s => s[Random.Shared.Next(s.Length)])
            .ToArray());

    private static bool IsValidKey(string key) => !string.IsNullOrEmpty(key) && key.All(c => Alphabet.Contains(c));
    
    private static int Mod(int x, int m) => (x % m + m) % m;
}