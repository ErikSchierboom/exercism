import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class Series {

    private final List<Integer> digits;

    public Series(String input) {
        digits = input.chars()
                    .map(i -> i - '0')
                    .boxed()
                    .collect(Collectors.toList());
    }

    public List<Integer> getDigits() {
        return digits;
    }

    public List<List<Integer>> slices(int size) {
        if (size > digits.size()) {
            throw new IllegalArgumentException("Slice size greater than number of digits.");
        }

        return IntStream.rangeClosed(0, digits.size() - size)
                .mapToObj(i -> digits.subList(i, i + size))
                .collect(Collectors.toList());
    }
}