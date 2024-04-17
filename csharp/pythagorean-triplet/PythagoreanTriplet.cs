using System.Collections.Generic;
using System.Linq;

public static class PythagoreanTriplet
{
    public static IEnumerable<(int a, int b, int c)> TripletsWithSum(int sum) =>
        from a in Enumerable.Range(2, sum / 3 - 2)
        from b in Enumerable.Range(a + 1, (sum - a) / 2 - a)
        let c = sum - a - b
        where a * a + b * b == c * c
        select (a, b, c);
}
