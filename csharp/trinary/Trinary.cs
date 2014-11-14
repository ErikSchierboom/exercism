namespace Exercism.trinary
{
    using System;
    using System.Collections.Generic;
    using System.Globalization;
    using System.Linq;

    public class Trinary
    {
        private static readonly HashSet<char> ValidChars = new HashSet<char> { '0', '1', '2' };
        private readonly string value;

        public Trinary(string value)
        {
            this.value = value;
        }

        public int ToDecimal()
        {
            if (this.value.All(ValidChars.Contains))
            {
                return this.GetDigits()
                           .Reverse()
                           .Select((digit, i) => digit * (int)Math.Pow(3, i))
                           .Sum();
            }

            return 0;
        }

        private IEnumerable<int> GetDigits()
        {
            return this.value.Select(c => int.Parse(c.ToString(CultureInfo.InvariantCulture)));
        }
    }
}