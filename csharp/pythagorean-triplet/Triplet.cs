using System.Collections.Generic;

namespace Exercism
{
    using System;
    using System.Linq;

    public class Triplet
    {
        private readonly int x;
        private readonly int y;
        private readonly int z;

        public Triplet(int x, int y, int z)
        {
            this.x = x;
            this.y = y;
            this.z = z;
        }

        public int Sum()
        {
            return Sum(this.x, this.y, this.z);
        }

        public int Product()
        {
            return this.x * this.y * this.z;
        }

        public bool IsPythagorean()
        {
            return IsPythagorean(this.x, this.y, this.z);
        }

        public static IEnumerable<Triplet> Where(int maxFactor, int? minFactor = null, int? sum = null)
        {
            return Where(maxFactor, minFactor ?? 1, sum);
        }

        private static IEnumerable<Triplet> Where(int maxFactor, int minFactor, int? sum = null)
        {
            return (from x in Enumerable.Range(minFactor, maxFactor - minFactor + 1)
                    from y in Enumerable.Range(x + 1, maxFactor - x)
                    let z = (int)Math.Sqrt(x * x + y * y)
                    where z <= maxFactor
                    where IsPythagorean(x, y, z)
                    where sum == null || Sum(x, y, z) == sum.Value
                    select new Triplet(x, y, z));
        }

        private static bool IsPythagorean(int x, int y, int z)
        {
            return x * x + y * y == z * z;
        }

        private static int Sum(int x, int y, int z)
        {
            return x + y + z;
        }
    }
}