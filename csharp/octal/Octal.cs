namespace Exercism.octal
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public class Octal
    {
        private static readonly HashSet<char> ValidDigits = new HashSet<char> { '0', '1', '2', '3', '4', '5', '6', '7' };

        private readonly char[] digits;

        public Octal(string value)
        {
            this.digits = value.ToCharArray();
        }

        public int ToDecimal()
        {
            if (!this.digits.All(ValidDigits.Contains))
            {
                return 0;
            }

            return this.digits.Reverse()
                              .Select(OctalToDecimal)
                              .Sum();
        }

        private static int OctalToDecimal(char c, int i)
        {
            return DigitToInt(c) * (int)Math.Pow(8, i);
        }

        private static int DigitToInt(char c)
        {
            return c - '0';
        }
    }
}