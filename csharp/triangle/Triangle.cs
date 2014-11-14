namespace Exercism.triangle
{
    using System;

    public class Triangle
    {
        private readonly TriangleKind kind;

        public Triangle(int x, int y, int z)
            : this((decimal)x, y, z)
        {
        }

        public Triangle(decimal x, decimal y, decimal z)
        {
            this.kind = DetermineKind(x, y, z);
        }

        public TriangleKind Kind()
        {
            return this.kind;
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
}