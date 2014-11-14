namespace Exercism
{
    using System.Collections.Generic;
    using System.Linq;
    using System.Text.RegularExpressions;

    public class Phrase
    {
        private readonly Dictionary<string, int> wordCount;

        public Phrase(string phrase)
        {
            this.wordCount = GetWords(phrase).GroupBy(w => w.ToLowerInvariant())
                                             .ToDictionary(g => g.Key, g => g.Count());
        }

        public Dictionary<string, int> WordCount()
        {
            return this.wordCount;
        }

        private static IEnumerable<string> GetWords(string phrase)
        {
            return Regex.Matches(phrase, @"\w+('\w+)*")
                .Cast<Match>()
                .Select(m => m.Value);
        }
    }
}