namespace anagram
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public class Anagram
    {
        private readonly HashSet<string> anagrams;

        public Anagram(string word)
        {
            this.anagrams = GenerateAnagrams(word);
        }

        public IEnumerable<string> Match(IEnumerable<string> input)
        {
            return input.ToSet().Intersect(this.anagrams, StringComparer.InvariantCultureIgnoreCase).ToList();
        }

        private static HashSet<string> GenerateAnagrams(string word)
        {
            return word.ToCharArray()
                       .Permutations()
                       .Select(chars => new string(chars.ToArray()))
                       .Except(new[] { word })
                       .ToSet();
        }
    }

    public static class EnumerableExtension
    {
        public static IEnumerable<IEnumerable<T>> Permutations<T>(this IEnumerable<T> input)
        {
            return PermutationsLoop(input.ToList(), new List<T>());
        }

        private static IEnumerable<IEnumerable<T>> PermutationsLoop<T>(IList<T> remainder, IList<T> accumulator)
        {
            if (remainder.Count == 0)
            {
                yield return accumulator;
            }
            else
            {
                for (var i = 0; i < remainder.Count; i++)
                {
                    var newAccumulator = new List<T>(accumulator) { remainder[i] };
                    var newRemainder = new List<T>(remainder);
                    newRemainder.RemoveAt(i);

                    foreach (var permutations in PermutationsLoop(newRemainder, newAccumulator))
                    {
                        yield return permutations;
                    }
                }
            }
        }

        public static HashSet<T> ToSet<T>(this IEnumerable<T> input)
        {
            return new HashSet<T>(input);
        }
    }
}