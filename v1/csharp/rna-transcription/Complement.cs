using System.Collections.Generic;
using System.Linq;

public static class Complement
{
    private static readonly IDictionary<char, char> DnaComplements = new Dictionary<char, char>
                                                                                {
                                                                                    { 'G', 'C' },
                                                                                    { 'C', 'G' },
                                                                                    { 'T', 'A' },
                                                                                    { 'A', 'U' }
                                                                                };

    public static string OfDna(string dna)
    {
        return Transcribe(dna, DnaComplements);
    }

    private static string Transcribe(string strand, IDictionary<char, char> complements)
    {
        return new string(strand.Select(n => complements[n]).ToArray());
    }
}