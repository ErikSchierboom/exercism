using System;
using System.Collections.Generic;
using System.Linq;

public static class NucleotideCount
{
    public static Dictionary<char, int> Count(string sequence) =>
        sequence.Aggregate(
            new Dictionary<char, int>{ ['A'] = 0, ['C'] = 0, ['G'] = 0, ['T'] = 0 }, 
            (counts, c) =>
            {
                counts[c] = counts.TryGetValue(c, out var count) ? ++count : throw new ArgumentException();
                return counts;
            });
}