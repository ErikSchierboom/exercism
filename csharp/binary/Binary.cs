namespace Exercism
{
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
                return binaryString.Aggregate(0, (acc, digit) => acc * 2 + digit - '0');
            }

            return InvalidBinaryDecimalValue;
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