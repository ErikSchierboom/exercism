using System;
using System.Collections.Generic;

public static class StrainExtensions
{
    public static IEnumerable<T> Keep<T>(this IEnumerable<T> value, Predicate<T> predicate)
    {
        foreach (var element in value)
        {
            if (predicate(element))
            {
                yield return element;
            }
        }
    }

    public static IEnumerable<T> Discard<T>(this IEnumerable<T> value, Predicate<T> predicate)
    {
        return value.Keep(x => !predicate(x));
    }
}