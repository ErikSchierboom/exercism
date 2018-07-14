import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class Sieve {
    private final int upTo;

    public Sieve(int upTo) {
        this.upTo = upTo;
    }

    public List<Integer> getPrimes() {
        List<Integer> possiblePrimes = IntStream.range(2, this.upTo + 1).boxed().collect(Collectors.toList());
        List<Integer> primes = new LinkedList<>();

        while (possiblePrimes.size() > 0) {
            int prime = possiblePrimes.get(0);
            primes.add(prime);

            possiblePrimes = excludeMultiples(prime, possiblePrimes);
        }

        return primes;
    }

    private static List<Integer> excludeMultiples(int prime, List<Integer> possiblePrimes) {
        return possiblePrimes
                .stream()
                .filter(x -> x % prime != 0)
                .collect(Collectors.toList());
    }
}
