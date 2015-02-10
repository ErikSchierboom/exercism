namespace Exercism
{
    using System;
    using System.Collections.Generic;

    public static class AccummulateExtensions
    {
        public static IEnumerable<TResult> Accumulate<TSource, TResult>(this IEnumerable<TSource> value, Func<TSource, TResult> selector)
        {
            foreach (var element in value)
            {
                yield return selector(element);
            }
        }
    }
}