import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class RomanNumeral {
    private String romanNumeral;

    public RomanNumeral(int input) {
        this.romanNumeral = toRomanNumeral(input);
    }

    public String getRomanNumeral() {
        return this.romanNumeral;
    }

    private static String toRomanNumeral(int input) {
        String numeral = "";
        int remainder = input;

        for (Map.Entry<Integer, String> entry : getRomanNumeralValues().entrySet()) {

            while (remainder >= entry.getKey()) {
                numeral += entry.getValue();
                remainder -= entry.getKey();
            }
        }

        return numeral;
    }

    private static Map<Integer, String> getRomanNumeralValues() {
        final Map<Integer, String> romanNumeralValues = new LinkedHashMap<Integer, String>();
        romanNumeralValues.put(1000, "M");
        romanNumeralValues.put(900, "CM");
        romanNumeralValues.put(500, "D");
        romanNumeralValues.put(400, "CD");
        romanNumeralValues.put(100, "C");
        romanNumeralValues.put(90, "XC");
        romanNumeralValues.put(50, "L");
        romanNumeralValues.put(40, "XL");
        romanNumeralValues.put(10, "X");
        romanNumeralValues.put(9, "IX");
        romanNumeralValues.put(5, "V");
        romanNumeralValues.put(4, "IV");
        romanNumeralValues.put(1, "I");

        return Collections.unmodifiableMap(romanNumeralValues);
    }
}