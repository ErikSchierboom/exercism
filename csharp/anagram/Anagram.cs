namespace Exercism
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public class Anagram
    {
        private readonly string target;
        private readonly string normalizedTarget;

        public Anagram(string target)
        {
            this.target = target;
            this.normalizedTarget = NormalizeWord(target);
        }

        public IEnumerable<string> Match(IEnumerable<string> sources)
        {
            return sources.Where(this.IsAnagram);
        }

        private bool IsAnagram(string source)
        {
            return NormalizeWord(source) == this.normalizedTarget && !string.Equals(source, this.target, StringComparison.InvariantCultureIgnoreCase);
        }

        private static string NormalizeWord(string word)
        {
            return new string(word.ToLowerInvariant().OrderBy(c => c).ToArray());
        }
    }
}