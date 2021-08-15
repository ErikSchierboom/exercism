using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public static class WordCount
{
    public static Dictionary<string, int> CountWords(string phrase) =>
        phrase.Words()
            .GroupBy(w => w.ToLowerInvariant())
            .ToDictionary(g => g.Key, g => g.Count());

    private static IEnumerable<string> Words(this string phrase) =>
        Regex.Matches(phrase, @"\w+('\w+)*").Select(m => m.Value);
}