using System;
using System.Linq;

public static class Grains
{
    public static double Square(int i) => Math.Pow(2, i - 1);

    public static double Total() => Enumerable.Range(1, 64).Select(Square).Sum();
}