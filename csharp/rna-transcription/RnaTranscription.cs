using System.Collections.Generic;
using System.Linq;

public static class RnaTranscription
{
    public static string ToRna(string nucleotide) => new(nucleotide.Select(n => DnaComplements[n]).ToArray());

    private static readonly Dictionary<char, char> DnaComplements = new Dictionary<char, char>
    {
        { 'G', 'C' },
        { 'C', 'G' },
        { 'T', 'A' },
        { 'A', 'U' }
    };
}