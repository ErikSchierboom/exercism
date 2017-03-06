import java.util.*;

final class ChangeCalculator {
    private final List<Integer> coins;

    public ChangeCalculator(List<Integer> coins) {
        this.coins = coins;
    }

    public List<Integer> computeMostEfficientChange(int target) {
        if (target < 0) {
            throw new IllegalArgumentException("Negative totals are not allowed.");
        }
        if (target > 0 && target < coins.get(0)) {
            throw new IllegalArgumentException("The total " + target + " cannot be represented in the given currency.");
        }
        if (target == 0) {
            return new LinkedList<>();
        }

        Map<Integer, List<Integer>> minimalCoins = new HashMap<>();
        minimalCoins.put(0, new LinkedList<>());

        for (int i = 1; i <= target; i++) {

            final int amount = i;

            List<Integer> minimalCoinsForAmount =
                coins
                    .stream()
                    .filter(c -> c <= amount)
                    .map(c -> prepend(c, minimalCoins.get(amount - c)))
                    .filter(c -> c.stream().mapToInt(j -> j).sum() == amount)
                    .sorted(Comparator.comparingInt(List::size))
                    .findFirst()
                    .orElse(new LinkedList<>());

            minimalCoins.put(amount, minimalCoinsForAmount);
        }

        List<Integer> mostEfficientChange = minimalCoins.get(target);

        if (mostEfficientChange.size() == 0) {
            throw new IllegalArgumentException("The total " + target + " cannot be represented in the given currency.");
        }

        return mostEfficientChange;
    }

    private static List<Integer> prepend(int coin, List<Integer> coins) {
        List<Integer> newCoins = new LinkedList<>(coins);

        newCoins.add(0, coin);
        return newCoins;
    }
}