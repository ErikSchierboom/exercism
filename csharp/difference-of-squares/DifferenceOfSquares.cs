using System.Collections.Generic;
using System.Linq;

public static class DifferenceOfSquares
{
    public static int CalculateSquareOfSum(int max) => Square(NaturalNumbers(max).Sum());

    public static int CalculateSumOfSquares(int max) => NaturalNumbers(max).Sum(Square);

    public static int CalculateDifferenceOfSquares(int max) => CalculateSquareOfSum(max) - CalculateSumOfSquares(max);

    private static IEnumerable<int> NaturalNumbers(int max) => Enumerable.Range(1, max);
    
    private static int Square(int number) => number * number;
}