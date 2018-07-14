using System;
using System.Collections.Generic;
using System.Linq;

public class NucleotideCount
{
    private static readonly char[] Nucleotides = new[] { 'A', 'C', 'G', 'T' };

    public NucleotideCount(string sequence)
    {
        if (!sequence.All(IsValidNucleotide))
        {
            throw new InvalidNucleotideException();
        }

        NucleotideCounts = Nucleotides.ToDictionary(nucleotide => nucleotide, nucleotide => sequence.Count(c => c == nucleotide));
    }

    private static bool IsValidNucleotide(char nucleotide) => Nucleotides.Contains(nucleotide);

    public IDictionary<char, int> NucleotideCounts { get; }
}

public class InvalidNucleotideException : Exception { }
