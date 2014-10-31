namespace nucleotide_count
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public class DNA
    {
        private static readonly HashSet<char> ValidNucleotides = new HashSet<char> { 'A', 'T', 'C', 'G' };

        public DNA(string strand)
        {
            this.NucleotideCounts = strand.GroupBy(c => c).ToDictionary(c => c.Key, c => c.Count());

            this.AddKeysForMissingNucleotides();
        }

        public Dictionary<char, int> NucleotideCounts { get; private set; }

        public int Count(char c)
        {
            if (ValidNucleotides.Contains(c))
            {
                return this.NucleotideCounts[c];
            }

            throw new InvalidNucleotideException();
        }

        private void AddKeysForMissingNucleotides()
        {
            foreach (var missingNucleotide in ValidNucleotides.Except(this.NucleotideCounts.Keys))
            {
                this.NucleotideCounts[missingNucleotide] = 0;
            }
        }
    }

    public class InvalidNucleotideException : Exception
    {
    }
}