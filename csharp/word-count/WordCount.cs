using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public class WordCount
{
    public static Dictionary<string, int> CountWords(string phrase)
    {
        return GetWords(phrase).GroupBy(w => w.ToLowerInvariant())
            .ToDictionary(g => g.Key, g => g.Count());
    }

    private static IEnumerable<string> GetWords(string phrase)
    {
        return Regex.Matches(phrase, @"\w+('\w+)*").Cast<Match>().Select(m => m.Value);
    }
}