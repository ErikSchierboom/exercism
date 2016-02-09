using System.Linq;

public static class Hamming
{
    public static int Compute(string strand1, string strand2)
    {
        return strand1.Zip(strand2, (c1, c2) => c1 == c2 ? 0 : 1).Sum();
    }
}