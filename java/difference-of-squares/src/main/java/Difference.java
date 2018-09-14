import java.util.stream.IntStream;

public final class Difference {
    public static int computeSquareOfSumTo(int i) {
        int sum = IntStream.range(1, i + 1).sum();
        return sum * sum;
    }

    public static int computeSumOfSquaresTo(int i) {
        return IntStream.range(1, i + 1).map(n -> n * n).sum();
    }

    public static int betweenSquareOfSumAndSumOfSquaresTo(int i) {
        return computeSquareOfSumTo(i) - computeSumOfSquaresTo(i);
    }
}