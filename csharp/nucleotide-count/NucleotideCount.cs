using System;
using System.Collections.Generic;
using System.Linq;

public static class NucleotideCount
{
    private const string Nucleotides = "ACGT";

    public static Dictionary<char, int> Count(string sequence)
    {
        if (!sequence.All(n => Nucleotides.Contains(n))) throw new ArgumentException();

        return Nucleotides.ToDictionary(n => n, n => sequence.Count(c => c == n));
    }
}