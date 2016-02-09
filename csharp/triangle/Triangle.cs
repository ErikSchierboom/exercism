using System;

public static class Triangle
{
    public static TriangleKind Kind(int x, int y, int z)
    {
        return Kind((decimal) x, y, z);
    }

    public static TriangleKind Kind(decimal x, decimal y, decimal z)
    {
        return DetermineKind(x, y, z);
    }

    private static TriangleKind DetermineKind(decimal x, decimal y, decimal z)
    {
        if (x == 0 && y == 0 && z == 0)
        {
            throw new TriangleException();
        }

        if (x < 0 || y < 0 || z < 0)
        {
            throw new TriangleException();
        }

        if (x + y <= z || x + z <= y || y + z <= x)
        {
            throw new TriangleException();
        }

        if (x == y && y == z)
        {
            return TriangleKind.Equilateral;
        }

        if (x == y || x == z || y == z)
        {
            return TriangleKind.Isosceles;
        }

        return TriangleKind.Scalene;
    }
}

public enum TriangleKind
{
    Equilateral,
    Isosceles,
    Scalene
}

public class TriangleException : Exception
{
}