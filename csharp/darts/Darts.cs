using System;

public static class Darts
{
    public static int Score(double x, double y)
    {
        var distance = Math.Sqrt(x * x + y * y);

        if (distance <= 1.0)
            return 10;
        if (distance <= 5.0)
            return 5;
        if (distance <= 10.0)
            return 1;

        return 0;
    }
}
