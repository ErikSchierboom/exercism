using System;
using System.Collections.Generic;
using System.Linq;

public class NucleotideCount
{
    private const string Nucleotides = "ACGT";

    public NucleotideCount(string sequence)
    {
        if (!sequence.All(n => Nucleotides.Contains(n))) throw new InvalidNucleotideException();

        NucleotideCounts = Nucleotides.ToDictionary(n => n, n => sequence.Count(c => c == n));
    }

    public IDictionary<char, int> NucleotideCounts { get; }
}

public class InvalidNucleotideException : Exception { }
