using NUnit.Framework;

namespace Exercism
{
    [TestFixture]
    public class RomanNumeralsTest
    {
        // Change 'Ignore = true' to 'Ignore = false' to run a test case.
        // You can also just remove 'Ignore = true'.

        [TestCase(0, Result = "")]
        [TestCase(1, Result = "I")]
        [TestCase(2, Result = "II")]
        [TestCase(3, Result = "III")]
        [TestCase(4, Result = "IV")]
        [TestCase(5, Result = "V")]
        [TestCase(6, Result = "VI")]
        [TestCase(9, Result = "IX")]
        [TestCase(27, Result = "XXVII")]
        [TestCase(48, Result = "XLVIII")]
        [TestCase(59, Result = "LIX")]
        [TestCase(93, Result = "XCIII")]
        [TestCase(141, Result = "CXLI")]
        [TestCase(163, Result = "CLXIII")]
        [TestCase(402, Result = "CDII")]
        [TestCase(575, Result = "DLXXV")]
        [TestCase(911, Result = "CMXI")]
        [TestCase(1024, Result = "MXXIV")]
        [TestCase(3000, Result = "MMM")]
        public string Convert_roman_to_arabic_numerals(int arabicNumeral)
        {
            return arabicNumeral.ToRoman();
        }
    }
}