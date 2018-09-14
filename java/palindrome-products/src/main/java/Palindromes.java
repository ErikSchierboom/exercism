import java.util.*;

public class Palindromes {
    private Optional<Integer> lessThanOrEqualTo = Optional.empty();
    private Optional<Integer> greaterThanOrEqualTo = Optional.empty();

    public static Palindromes getPalindromeSortedListBuilder() {
        return new Palindromes();
    }

    public Palindromes withFactorsLessThanOrEqualTo(int value) {
        lessThanOrEqualTo = Optional.of(value);
        return this;
    }

    public Palindromes withFactorsGreaterThanOrEqualTo(int value) {
        greaterThanOrEqualTo = Optional.of(value);
        return this;
    }

    public SortedMap<Long, List<List<Integer>>> build() {
        int maxFactor = lessThanOrEqualTo.orElse(1);
        int minFactor = greaterThanOrEqualTo.orElse(1);

        TreeMap<Long, List<List<Integer>>> result = new TreeMap<>();

        for (int x = minFactor; x <= maxFactor; x++) {
            for (int y = x; y <= maxFactor; y++) {
                long product = (long)x * y;

                if (isPalindrome(product)) {
                    if (!result.containsKey(product))
                        result.put(product, new LinkedList<>());

                    result.get(product).add(Arrays.asList(x, y));
                }
            }
        }

        return result;
    }

    private static boolean isPalindrome(long num) {
        long n = num;
        long rev = 0;

        while (num > 0) {
            long dig = num % 10;
            rev = rev * 10 + dig;
            num = num / 10;
        }

        return n == rev;
    }
}