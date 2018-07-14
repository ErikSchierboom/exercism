using System;
using System.Collections.Generic;
using System.Linq;

public class LargestSeriesProduct
{
    public LargestSeriesProduct(string str)
    {
        Digits = str.ToCharArray().Select(c => int.Parse(c.ToString())).ToArray();
    }

    public int[] Digits { get; }

    public IEnumerable<IEnumerable<int>> GetSlices(int sliceLength)
    {
        if (sliceLength > Digits.Length)
        {
            throw new ArgumentException("Slice size is too big");
        }

        return Enumerable.Range(0, GetNumberOfSlices(sliceLength)).Select(i => Digits.Skip(i).Take(sliceLength));
    }

    public int GetLargestProduct(int seriesLength) => GetSlices(seriesLength).Max(GetProduct);

    private static int GetProduct(IEnumerable<int> numbers) => numbers.Aggregate(1, (x, product) => x * product);

    private int GetNumberOfSlices(int sliceLength) => Digits.Length + 1 - sliceLength;
}