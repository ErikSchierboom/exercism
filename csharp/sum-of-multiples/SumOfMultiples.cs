namespace sum_of_multiples
{
    using System.Collections.Generic;
    using System.Linq;

    public class SumOfMultiples
    {
        private readonly IEnumerable<int> multiples;

        public SumOfMultiples()
            : this(new List<int> { 3, 5 })
        {
        }

        public SumOfMultiples(IEnumerable<int> multiples)
        {
            this.multiples = multiples;
        }

        public int To(int max)
        {
            return Enumerable.Range(1, max - 1)
                .Where(i => this.multiples.Any(m => i % m == 0))
                .Sum();
        }
    }
}