using System.Collections.Generic;
using System.Linq;

public enum SublistType { Equal, Unequal, Superlist, Sublist }

public static class Sublist
{
    public static SublistType Classify<T>(List<T> first, List<T> second) =>
        (first.Count - second.Count) switch
        {
            < 0 => IsSublist(first, second) ? SublistType.Sublist   : SublistType.Unequal,
            > 0 => IsSublist(second, first) ? SublistType.Superlist : SublistType.Unequal,
              0 => AreEqual(first, second)  ? SublistType.Equal     : SublistType.Unequal
        };
    
    private static bool IsSublist<T>(List<T> first, List<T> second) =>
        second.Windowed(first.Count).Any(sublist => AreEqual(first, sublist));

    private static bool AreEqual<T>(IEnumerable<T> first, IEnumerable<T> second) =>
        first.Zip(second).All(pair => pair.First.Equals(pair.Second));

    private static IEnumerable<IEnumerable<T>> Windowed<T>(this List<T> list, int count) =>
        Enumerable.Range(0, list.Count - count + 1).Select(i => list.Skip(i).Take(count));
}