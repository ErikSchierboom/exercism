import java.util.List;

public class BinarySearch<T extends Comparable<T>> {

    private final List<T> input;

    public BinarySearch(List<T> input) {
        this.input = input;
    }

    public int indexOf(T value) {
        if (input.isEmpty())
            return -1;

        return indexOf(value, 0, input.size() - 1);
    }

    public int indexOf(T value, int minIndex, int maxIndex) {
        int middleIndex = (minIndex + maxIndex) / 2;

        if (input.get(middleIndex).compareTo(value) == 0)
            return middleIndex;

        if (middleIndex <= 0 || middleIndex >= input.size() - 1 || middleIndex < minIndex)
            return -1;

        if (input.get(middleIndex).compareTo(value) > 0)
            return indexOf(value, minIndex, middleIndex - 1);

        return indexOf(value, middleIndex + 1, maxIndex);
    }
}
