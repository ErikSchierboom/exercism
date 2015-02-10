namespace Exercism
{
    using System.Linq;

    public class Trinary
    {
        private const int InvalidTrinaryValue = 0;

        private readonly int trinaryValue;

        public Trinary(string trinaryString)
        {
            this.trinaryValue = CalculateTrinaryValue(trinaryString);
        }

        private static int CalculateTrinaryValue(string trinaryString)
        {
            if (IsValidTrinaryString(trinaryString))
            {
                return trinaryString.Aggregate(0, (acc, digit) => acc * 3 + digit - '0');
            }

            return InvalidTrinaryValue;
        }

        private static bool IsValidTrinaryString(string binary)
        {
            return binary.All(c => c >= '0' && c <= '2');
        }

        public int ToDecimal()
        {
            return this.trinaryValue;
        }
    }
}