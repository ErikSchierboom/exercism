using System;
using System.Linq;

public static class RnaTranscription
{
    public static string ToRna(string dna) =>
        new(dna.Select(ToComplement).ToArray());

    private static char ToComplement(char nucleotide) =>
        nucleotide switch
        {
            'G' => 'C',
            'C' => 'G',
            'T' => 'A',
            'A' => 'U',
            _ => throw new ArgumentOutOfRangeException(nameof(nucleotide))
        };
}
    