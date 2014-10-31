namespace binary
{
    using System;
    using System.Linq;

    public class Binary
    {
        private const int InvalidBinaryDecimalValue = 0;

        private readonly int decimalValue;

        public Binary(string binaryString)
        {
            this.decimalValue = CalculateDecimalValue(binaryString);
        }

        private static int CalculateDecimalValue(string binaryString)
        {
            if (IsValidBinaryString(binaryString))
            {
                return binaryString.Reverse().Select(DigitValue).Sum();
            }

            return InvalidBinaryDecimalValue;
        }

        private static int DigitValue(char digit, int index)
        {
            return digit == '0' ? 0 : (int)Math.Pow(2, index);
        }

        private static bool IsValidBinaryString(string binary)
        {
            return binary.All(c => c == '0' || c == '1');
        }

        public int ToDecimal()
        {
            return this.decimalValue;
        }
    }
}