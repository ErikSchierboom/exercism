using System;
using System.Linq;

public static class Grains
{
    public static double Square(int i)
    {
        if (i <= 0 || i > 64)
        {
            throw new ArgumentOutOfRangeException(nameof(i));
        }
        
        return Math.Pow(2, i - 1);
    }

    public static double Total() => Enumerable.Range(1, 64).Select(Square).Sum();
}