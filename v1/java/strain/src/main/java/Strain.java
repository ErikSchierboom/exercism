import java.util.LinkedList;
import java.util.List;
import java.util.function.Predicate;

public class Strain {
    public static <T> List<T> keep(List<T> input, Predicate<T> predicate) {
        LinkedList<T> result = new LinkedList<T>();

        for (T item: input) {
            if (predicate.test(item)) {
                result.add(item);
            }
        }

        return result;
    }

    public static <T> List<T> discard(List<T> input, Predicate<T> predicate) {
        return keep(input, predicate.negate());
    }
}
