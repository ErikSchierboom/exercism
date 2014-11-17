using System;
using System.Linq;

namespace Exercism
{
    public class Squares
    {
        private readonly int number;

        public Squares(int number)
        {
            if (number < 0)
            {
                throw new ArgumentException("Negative numbers are not allowed.", "number");
            }

            this.number = number;
        }

        public int SumOfSquares()
        {
            return Enumerable.Range(1, this.number).Sum(i => i * i);
        }

        public int SquareOfSums()
        {
            return (int)Math.Pow(Enumerable.Range(1, this.number).Sum(), 2);
        }

        public int DifferenceOfSquares()
        {
            return this.SquareOfSums() - this.SumOfSquares();
        }
    }
}