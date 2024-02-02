using System;
using System.Linq;

public static class ProteinTranslation
{
    public static string[] Proteins(string strand) =>
        strand
            .Chunk(3)
            .Select(chunk => string.Concat(chunk))
            .Select(ToProtein)
            .TakeWhile(protein => protein != "STOP")
            .ToArray();

    private static string ToProtein(string input) =>
        input switch
        {
            "AUG" => "Methionine",
            "UGG" => "Tryptophan",
            "UUU" or "UUC" => "Phenylalanine",
            "UUA" or "UUG" => "Leucine",
            "UAU" or "UAC" => "Tyrosine",
            "UGU" or "UGC" => "Cysteine",
            "UCU" or "UCC" or "UCA" or "UCG" => "Serine",
            "UAA" or "UAG" or "UGA" => "STOP",
            _ => throw new Exception("Invalid sequence")
        };
}