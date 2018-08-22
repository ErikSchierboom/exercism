using System;
using System.Collections.Generic;
using System.Linq;

public class Anagram
{
    private readonly string _word;
    private readonly IEnumerable<char> _normalizedWord;

    public Anagram(string word)
        => (_word, _normalizedWord) = (word, Normalize(word));

    public IEnumerable<string> Anagrams(IEnumerable<string> sources) 
        => sources.Where(IsAnagram).ToArray();

    private bool IsAnagram(string possibleAnagram) 
        => HasMatchingCharacters(possibleAnagram) && IsDifferentFromWord(possibleAnagram);

    private bool HasMatchingCharacters(string possibleAnagram) 
        => Normalize(possibleAnagram).SequenceEqual(_normalizedWord);

    private bool IsDifferentFromWord(string possibleAnagram) 
        => !string.Equals(possibleAnagram, _word, StringComparison.InvariantCultureIgnoreCase);

    private static IEnumerable<char> Normalize(string word) 
        => word.ToLowerInvariant().OrderBy(c => c);
}