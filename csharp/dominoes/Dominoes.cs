using System;
using System.Collections.Generic;
using System.Linq;

public static class Dominoes
{
    public static bool CanChain(Tuple<int, int>[] dominoes)
    {
        if (!dominoes.Any())
            return true;

        var domino = dominoes.First();

        if (dominoes.Length == 1)
            return domino.Item1 == domino.Item2;

        return dominoes.Skip(1).Rotations().Any(sublist => PossibleChains(domino, sublist).Any(CanChain));
    }

    private static IEnumerable<Tuple<int, int>[]> PossibleChains(Tuple<int, int> domino, IEnumerable<Tuple<int, int>> remainder)
    {
        var (item1, item2) = remainder.First();

        if (domino.Item2 == item1)
            yield return new[] { Tuple.Create(domino.Item1, item2) }.Concat(remainder.Skip(1)).ToArray();
        else if (domino.Item2 == item2)
            yield return new[] { Tuple.Create(domino.Item1, item1) }.Concat(remainder.Skip(1)).ToArray();
    }

    private static IEnumerable<IEnumerable<T>> Rotations<T>(this IEnumerable<T> input) =>
        Enumerable.Range(0, input.Count()).Select(input.Rotate);
    
    private static IEnumerable<T> Rotate<T>(this IEnumerable<T> input, int offset) =>
        input.Skip(offset).Take(input.Count() - offset).Concat(input.Take(offset));
}