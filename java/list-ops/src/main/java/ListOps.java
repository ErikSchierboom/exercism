import java.util.LinkedList;
import java.util.List;
import java.util.function.*;

public class ListOps {
    public static int length(List<Integer> list) {
        return list.size();
    }

    public static <T> List<T> map(List<T> list, UnaryOperator<T> operator) {
        List<T> mapped = new LinkedList<>();

        for (T value: list) {
            mapped.add(operator.apply(value));
        }

        return mapped;
    }

    public static <T> List<T> filter(List<T> list, Predicate<T> predicate) {
        List<T> filtered = new LinkedList<>();

        for (T value: list) {
            if (predicate.test(value)) {
                filtered.add(value);
            }
        }

        return filtered;
    }

    public static <T> List<T> reverse(List<T> list) {
        List<T> reversed = new LinkedList<>();

        for (int i = list.size() - 1; i >= 0; i--) {
            reversed.add(list.get(i));
        }

        return reversed;
    }

    public static <T> List<T> concat(List<T>... lists) {
        List<T> concatenated = new LinkedList<>();

        for (List<T> list: lists) {
            for (T value: list) {
                concatenated.add(value);
            }
        }

        return concatenated;
    }

    public static <U, T> U reduce(List<T> list, U identity, BiFunction<U, T, U> accumulator, BinaryOperator<U> combiner) {
        if (list.isEmpty()) {
            return identity;
        }

        U result = identity;
        for (T element : list) {
            result = accumulator.apply(result, element);
        }

        return result;
    }
}