using System.Collections.Generic;
using System.Linq;

public static class SumOfMultiples
{
    public static int Sum(IEnumerable<int> factors, int limit) =>
        Enumerable.Range(1, limit - 1)
            .Where(i => factors.Any(factor => i % factor == 0))
            .Sum();
}