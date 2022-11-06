using System;

public static class Darts
{
    public static int Score(double x, double y) =>
        Math.Sqrt(x * x + y * y) switch
        {
            > 10.0 => 0,
            > 5.0 => 1,
            > 1.0 => 5,
            _ => 10
        };
}
