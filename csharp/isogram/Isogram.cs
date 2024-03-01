using System.Collections;
using System.Linq;

public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        var seen = new BitArray(26);

        foreach (var c in word.Where(char.IsLetter).Select(char.ToLower))
        {
            if (seen.Get(c - 'a'))
                return false;

            seen.Set(c - 'a', true);
        }

        return true;
    }
}
