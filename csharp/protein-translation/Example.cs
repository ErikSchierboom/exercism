using System;
using System.Collections.Generic;
using System.Linq;

public static class ProteinTranslation
{
    public static IEnumerable<string> Translate(string codons)
    {
        return codons.Chunks(3).Select(TranslateCodon).TakeWhile(x => x != "STOP").ToList();
    }

    private static string TranslateCodon(string codon)
    {
        switch (codon)
        {
            case "AUG":
                return "Methionine";
            case "UUC":
            case "UUU":
                return "Phenylalanine";
            case "UUA":
            case "UUG":
                return "Leucine";
            case "UCU":
            case "UCC":
            case "UCA":
            case "UCG":
                return "Serine";
            case "UAU":
            case "UAC":
                return "Tyrosine";
            case "UGU":
            case "UGC":
                return "Cysteine";
            case "UGG":
                return "Tryptophan";
            case "UAA":
            case "UAG":
            case "UGA":
                return "STOP";
            default:
                throw new ArgumentException();
        }
    }

    private static IEnumerable<string> Chunks(this string str, int chunkSize)
    {
        return Enumerable.Range(0, (int)Math.Ceiling(str.Length / (double)chunkSize))
                         .Select(i => str.Substring(i * chunkSize, Math.Min(str.Length - i * chunkSize, chunkSize)));
    }
}