namespace hamming
{
    using System;

    public static class Hamming
    {
        public static int Compute(string strand1, string strand2)
        {
            var sum = 0;

            for (var i = 0; i < Math.Min(strand1.Length, strand2.Length); i++)
            {
                sum += strand1[i] == strand2[i] ? 0 : 1;
            }

            return sum;
        }
    }
}