using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

public static class LargestSeriesProduct
{
    public static int GetLargestProduct(string input, int span)
    {
        if (span < 0 || span > input.Length) throw new ArgumentException("Invalid size");
        if (!input.All(char.IsDigit)) throw new ArgumentException("Invalid input");
        
        return input.Digits().Windowed(span).Max(Product);
    }
    
    private static int[] Digits(this string str) =>
        str.Select(CharUnicodeInfo.GetDecimalDigitValue).ToArray();

    private static IEnumerable<IEnumerable<T>> Windowed<T>(this T[] enumerable, int size)
    {
        for (var i = 0; i < enumerable.Length - size + 1; i++)
            yield return enumerable.Skip(i).Take(size);
    }

    private static int Product(this IEnumerable<int> numbers) =>
        numbers.Aggregate(1, (x, product) => x * product);
}