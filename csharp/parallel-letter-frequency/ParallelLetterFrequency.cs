using System.Collections.Generic;
using System.Linq;

public static class ParallelLetterFrequency
{
    public static Dictionary<char, int> Calculate(IEnumerable<string> texts) =>
        texts.AsParallel().Aggregate(new Dictionary<char, int>(), AddCount);

    private static Dictionary<char, int> AddCount(Dictionary<char, int> target, string text)
    {
        foreach (var letter in text.ToLower().Where(char.IsLetter))
            if (!target.TryAdd(letter, 1))
                target[letter] += 1;

        return target;
    }
}