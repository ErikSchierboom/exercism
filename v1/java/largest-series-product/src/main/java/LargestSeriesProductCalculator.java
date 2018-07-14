import java.util.Arrays;
import java.util.stream.IntStream;

public class LargestSeriesProductCalculator {

    private final int[] digits;

    public LargestSeriesProductCalculator(String input) {
        if (input == null) {
            throw new IllegalArgumentException("String to search must be non-null.");
        }
        if (!input.matches("^[0-9]*$")) {
            throw new IllegalArgumentException("String to search may only contains digits.");
        }

        digits = input.chars().map(x -> x - '0').toArray();
    }

    public long calculateLargestProductForSeriesLength(int length) {
        if (length < 0) {
            throw new IllegalArgumentException("Series length must be non-negative.");
        }
        if (length > digits.length) {
            throw new IllegalArgumentException("Series length must be less than or equal to the length of the string to search.");
        }

        return IntStream.range(0, numberOfSlices(length))
                .mapToLong(i -> seriesProduct(i, length))
                .max()
                .orElse(0);
    }

    private int[] slice(int i, int length) {
        return Arrays.copyOfRange(digits, i, i + length);
    }

    private long seriesProduct(int i, int length) {
        long product = 1;

        for (int j: slice(i, length)) {
            product *= j;
        }

        return product;
    }

    private int numberOfSlices(int length) {
        return digits.length + 1 - length;
    }
}
