namespace Exercism
{
    using System.Linq;

    public class Octal
    {
        private const int InvalidOctalValue = 0;

        private readonly int octalValue;

        public Octal(string octalString)
        {
            this.octalValue = CalculateOctalValue(octalString);
        }

        private static int CalculateOctalValue(string binaryString)
        {
            if (IsValidOctalString(binaryString))
            {
                return binaryString.Aggregate(0, (acc, digit) => acc * 8 + digit - '0');
            }

            return InvalidOctalValue;
        }

        private static bool IsValidOctalString(string binary)
        {
            return binary.All(c => c >= '0' && c <= '7');
        }

        public int ToDecimal()
        {
            return this.octalValue;
        }
    }
}