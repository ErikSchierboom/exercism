using System.Collections.Generic;

public static class PythagoreanTriplet
{
    public static IEnumerable<(int a, int b, int c)> TripletsWithSum(int sum)
    {
        for (var a = 1; a <= sum / 3 - 1; ++a)
        {
            for (var b = a + 1; b <= (sum - a) / 2; ++b)
            {
                var c = sum - a - b;
                if (a * a + b * b == c * c)
                    yield return (a, b, c);
            }
        }
    }
}
