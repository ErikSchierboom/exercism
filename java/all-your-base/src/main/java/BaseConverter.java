import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

final class BaseConverter {
    private final int fromBase;

    public BaseConverter(int from, int[] digits) {
        if (from < 2)
            throw new IllegalArgumentException("Bases must be at least 2.");
        if (Arrays.stream(digits).anyMatch(digit -> digit < 0))
            throw new IllegalArgumentException("Digits may not be negative.");
        if (Arrays.stream(digits).anyMatch(digit -> digit >= from))
            throw new IllegalArgumentException("All digits must be strictly less than the base.");
        if (digits.length == 0)
            throw new IllegalArgumentException("You must supply at least one digit.");
        if (digits.length > 1 && digits[0] == 0)
            throw new IllegalArgumentException("Digits may not contain leading zeros.");

        fromBase = convertFromBase(from, digits);
    }

    private int convertFromBase(int from, int[] digits) {
        int fromBase = 0;

        for (int digit : digits) {
            fromBase = fromBase * from + digit;
        }

        return fromBase;
    }

    public int[] convertToBase(int to) {
        if (to < 2)
            throw new IllegalArgumentException("Bases must be at least 2.");
        if (fromBase == 0)
            return new int[]{0};

        List<Integer> digits = new LinkedList<>();
        int remainder = fromBase;
        int multiplier = 1;

        while (remainder > 0)
        {
            multiplier *= to;

            int value = remainder % multiplier;
            int digit = value/(multiplier/to);

            digits.add(digit);
            remainder -= value;
        }

        Collections.reverse(digits);
        return digits.stream().mapToInt(i -> i).toArray();
    }
}