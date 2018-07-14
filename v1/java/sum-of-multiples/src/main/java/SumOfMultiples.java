import java.util.Arrays;
import java.util.stream.IntStream;

public class SumOfMultiples {
    public int Sum(int upperBound, int[] numbers) {
        return IntStream.range(1, upperBound)
                .filter(i -> Arrays.stream(numbers).anyMatch(j -> i % j == 0))
                .sum();
    }
}