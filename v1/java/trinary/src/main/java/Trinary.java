public class Trinary {
    private static final int INVALID_TRINARY_DECIMAL_VALUE = 0;

    public static int toDecimal(String input) {
        return calculateDecimalValue(input);
    }

    private static int calculateDecimalValue(String input)
    {
        if (isValidTrinaryString(input)) {
            return input.chars()
                    .reduce(0, (acc, digit) -> acc * 3 + digit - '0');
        }

        return INVALID_TRINARY_DECIMAL_VALUE;
    }

    private static boolean isValidTrinaryString(String input) {
        return input.matches("^[012]*$");
    }
}
