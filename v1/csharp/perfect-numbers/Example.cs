using System.Linq;

public enum NumberType
{
    Deficient,
    Perfect,
    Abundant
}

public class PerfectNumbers
{
    public static NumberType Classify(int number)
    {
        var sumOfFactors = Enumerable.Range(1, number/2).Where(x => number%x == 0).Sum();

        if (sumOfFactors == number)
        { 
            return NumberType.Perfect;
        }

        return sumOfFactors < number ? NumberType.Deficient : NumberType.Abundant;
    }
}