import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;

public class Accumulate {
    public static <T> List<T> accumulate(List<T> input, Function<T, T> map) {
        List<T> results = new LinkedList<T>();

        for (T element: input) {
            results.add(map.apply(element));
        }

        return results;
    }
}
