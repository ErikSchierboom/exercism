namespace Exercism.luhn
{
    using System.Collections.Generic;
    using System.Globalization;
    using System.Linq;

    public class Luhn
    {
        public Luhn(long number)
        {
            this.Addends = GetDigits(number).Reverse().Select(GetDigitValue).Reverse();
        }

        public IEnumerable<int> Addends { get; private set; }

        public int CheckDigit
        {
            get
            {
                return this.Addends.Last();
            }
        }

        public int Checksum
        {
            get
            {
                return this.Addends.Sum();
            }
        }

        public bool Valid
        {
            get
            {
                return this.Checksum % 10 == 0;
            }
        }

        public static long Create(long number)
        {
            var targetNumber = number * 10;

            var luhn = new Luhn(targetNumber);

            if (!luhn.Valid)
            {
                targetNumber += 10 - (luhn.Checksum % 10);    
            }

            return targetNumber;
        }

        private static IEnumerable<int> GetDigits(long i)
        {
            return i.ToString(CultureInfo.InvariantCulture).Select(c => c - '0');
        }

        private static int GetDigitValue(int digit, int index)
        {
            if (index % 2 == 0)
            {
                return digit;
            }

            var doubledValue = digit * 2;
            return doubledValue > 9 ? doubledValue - 9 : doubledValue;
        }
    }
}