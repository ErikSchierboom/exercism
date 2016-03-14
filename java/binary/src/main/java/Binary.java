public class Binary {
    private static final int InvalidBinaryDecimalValue = 0;

    private int decimal;

    public Binary(String input) {
        decimal = calculateDecimalValue(input);
    }

    public int getDecimal() {
        return decimal;
    }

    private static int calculateDecimalValue(String binaryString)
    {
        if (IsValidBinaryString(binaryString)) {
            return binaryString.chars()
                               .reduce(0, (acc, digit) -> acc * 2 + digit - '0');
        }

        return InvalidBinaryDecimalValue;
    }

    private static boolean IsValidBinaryString(String binary) {
        return binary.matches("^[01]*$");
    }
}
