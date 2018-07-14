import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

public class PythagoreanTripletBuilder {

    private Optional<Integer> factorsLessThanOrEqual = Optional.empty();
    private Optional<Integer> factorsGreaterThanOrEqual = Optional.empty();
    private Optional<Integer> sumTo = Optional.empty();

    public PythagoreanTripletBuilder withFactorsLessThanOrEqualTo(int i) {
        factorsLessThanOrEqual = Optional.of(i);
        return this;
    }

    public PythagoreanTripletBuilder withFactorsGreaterThanOrEqualTo(int i) {
        factorsGreaterThanOrEqual = Optional.of(i);
        return this;
    }

    public PythagoreanTripletBuilder thatSumTo(int i) {
        sumTo = Optional.of(i);
        return this;
    }

    public List<PythagoreanTriplet> build() {
        int minFactor = factorsGreaterThanOrEqual.orElse(1);
        int maxFactor = factorsLessThanOrEqual.get();

        List<PythagoreanTriplet> triplets = new LinkedList<>();
        for (int i = minFactor; i < maxFactor - 1; i++) {
            for (int j = i + 1; j < maxFactor; j++) {
                for (int k = j + 1; k <= maxFactor; k++) {
                    PythagoreanTriplet triplet = new PythagoreanTriplet(i, j, k);
                    if (includeTriplet(triplet))
                        triplets.add(triplet);
                }
            }
        }

        return triplets;
    }

    private boolean includeTriplet(PythagoreanTriplet triplet) {
        if (triplet.isPythagorean()) {
            return sumTo.orElse(triplet.calculateSum()) == triplet.calculateSum();
        }

        return false;
    }
}
