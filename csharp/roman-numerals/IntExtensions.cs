namespace roman_numerals
{
    using System.Collections.Generic;

    public static class IntExtensions
    {
        private static readonly Dictionary<int, string> RomanNumeralValues = new Dictionary<int, string>
                                                                             {
                                                                                 { 1000, "M"  },
                                                                                 { 900,  "CM" },
                                                                                 { 500,  "D"  },
                                                                                 { 400,  "CD" },
                                                                                 { 100,  "C"  },
                                                                                 { 90,   "XC" },
                                                                                 { 50,   "L"  },
                                                                                 { 40,   "XL" },
                                                                                 { 10,   "X"  },
                                                                                 { 9,    "IX" },
                                                                                 { 5,    "V"  },
                                                                                 { 4,    "IV" },
                                                                                 { 1,    "I"  },
                                                                             };

        public static string ToRoman(this int number)
        {
            foreach (var romanNumeral in RomanNumeralValues)
            {
                if (number >= romanNumeral.Key)
                {
                    return romanNumeral.Value + (number - romanNumeral.Key).ToRoman();
                }
            }

            return string.Empty;
        }
    }
}