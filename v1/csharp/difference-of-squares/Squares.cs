using System;
using System.Collections.Generic;
using System.Linq;

public class Squares
{
    private readonly IEnumerable<int> numbers;

    public Squares(int number)
    {
        if (number < 0)
        {
            throw new ArgumentException("Negative numbers are not allowed.", "number");
        }

        this.numbers = Enumerable.Range(1, number);
    }

    public long SumOfSquares()
    {
        return this.numbers.Sum(i => i * i);
    }

    public long SquareOfSums()
    {
        var sum = this.numbers.Sum();
        return sum * sum;
    }

    public long DifferenceOfSquares()
    {
        var aggregate = this.numbers.Aggregate(new[] { 0, 0 }, (acc, i) =>
        {
            acc[0] += i;
            acc[1] += i * i;
            return acc;
        });

        return aggregate[0] * aggregate[0] - aggregate[1];
    }
}