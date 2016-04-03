public class Octal {
    private static final int INVALID_OCTAL_DECIMAL_VALUE = 0;

    private final String input;

    public Octal(String input) {

        this.input = input;
    }

    public int getDecimal() {
        return calculateDecimalValue(this.input);
    }

    private static int calculateDecimalValue(String input)
    {
        if (isValidOctalString(input)) {
            return input.chars()
                    .reduce(0, (acc, digit) -> acc * 8 + digit - '0');
        }

        return INVALID_OCTAL_DECIMAL_VALUE;
    }

    private static boolean isValidOctalString(String input) {
        return input.matches("^[01234567]*$");
    }
}

