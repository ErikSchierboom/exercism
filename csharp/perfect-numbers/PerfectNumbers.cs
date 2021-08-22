using System;
using System.Linq;

public enum Classification
{
    Perfect,
    Abundant,
    Deficient
}

public class PerfectNumbers
{
    public static Classification Classify(int number)
    {
        if (number < 1)
            throw new ArgumentOutOfRangeException();
        
        var sumOfFactors = Enumerable.Range(1, number / 2).Where(x => number%x == 0).Sum();
        if (sumOfFactors < number)
            return Classification.Deficient;
        
        if (sumOfFactors > number)
            return Classification.Abundant;
        
        return Classification.Perfect;
    }
}