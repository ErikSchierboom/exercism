public class Hexadecimal {
    private static final int INVALID_HEXADECIMAL_DECIMAL_VALUE = 0;

    public static int toDecimal(String input) {
        return calculateDecimalValue(input);
    }

    private static int calculateDecimalValue(String input)
    {
        if (IsValidHexadecimalString(input)) {
            return input.chars()
                    .reduce(0, (acc, digit) -> acc * 16 + toDecimal(digit));
        }

        return INVALID_HEXADECIMAL_DECIMAL_VALUE;
    }

    private static int toDecimal(int digit) {
        if (Character.isDigit(digit)) {
            return digit - '0';
        }

        return digit - 'a' + 10;
    }

    private static boolean IsValidHexadecimalString(String input) {
        return input.matches("^[0-9abcdef]*$");
    }
}
