using System;
using System.Collections.Generic;

public static class AccumulateExtensions
{
    public static IEnumerable<TResult> Accumulate<TSource, TResult>(this IEnumerable<TSource> collection, Func<TSource, TResult> map)
    {
        foreach (var element in collection)
            yield return map(element);
    }
}