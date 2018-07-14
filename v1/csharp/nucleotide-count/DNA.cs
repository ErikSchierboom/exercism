using System;
using System.Collections.Generic;

public class DNA
{
    private readonly Dictionary<char, int> nucleotideCounts = new Dictionary<char, int> { { 'A', 0 }, { 'T', 0 }, { 'C', 0 }, { 'G', 0 } };

    public DNA(string strand)
    {
        foreach (var nucleotide in strand)
        {
            this.nucleotideCounts[nucleotide]++;
        }
    }

    public Dictionary<char, int> NucleotideCounts
    {
        get
        {
            return this.nucleotideCounts;
        }
    }

    public int Count(char c)
    {
        if (this.nucleotideCounts.ContainsKey(c))
        {
            return this.nucleotideCounts[c];
        }

        throw new InvalidNucleotideException();
    }
}

public class InvalidNucleotideException : Exception
{
}