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
        normalizedTarget = NormalizeWord(target);
    }

    public IEnumerable<string> Anagrams(IEnumerable<string> sources)
    {
        return sources.Where(IsAnagram);
    }

    private bool IsAnagram(string source)
    {
        return NormalizeWord(source) == normalizedTarget && !string.Equals(source, target, StringComparison.InvariantCultureIgnoreCase);
    }

    private static string NormalizeWord(string word)
    {
        return new string(word.ToLowerInvariant().OrderBy(c => c).ToArray());
    }
}