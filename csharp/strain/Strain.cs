using System;
using System.Collections.Generic;

public static class Strain
{
    public static IEnumerable<T> Keep<T>(this IEnumerable<T> source, Predicate<T> predicate)
    {
        foreach (var element in source)
        {
            if (predicate(element))
                yield return element;
        }
    }

    public static IEnumerable<T> Discard<T>(this IEnumerable<T> source, Predicate<T> predicate) 
        => source.Keep(element => !predicate(element));
}