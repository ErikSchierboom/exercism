import java.util.stream.IntStream;

public class Prime {
    public static int nth(int upTo) {
        return primes()
                .skip(upTo - 1)
                .findFirst()
                .getAsInt();
    }

    private static IntStream primes() {
        return IntStream.concat(IntStream.of(2, 3), possiblePrimes().filter(Prime::isPrime));
    }

    private static IntStream possiblePrimes() {
        return IntStream.iterate(6, i -> i + 6)
                .flatMap(i -> IntStream.of(i - 1, i + 1));
    }

    private static boolean isPrime(int n) {
        int r = (int) Math.floor(Math.sqrt(n));

        return r < 5 || IntStream.range(5, r + 1).allMatch(x -> n % x != 0);
    }
}