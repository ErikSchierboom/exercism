import java.util.*;

public class CustomSet<T> {
    private final Map<Integer, T> elements;

    public CustomSet(List<T> input) {
        elements = new HashMap<>();

        for (T element: input) {
            add(element);
        }
    }

    public void add(T element) {
        if (contains(element))
            return;

        elements.put(element.hashCode(), element);
    }

    public boolean isEmpty() {
        return elements.isEmpty();
    }

    public boolean contains(T value) {
        return elements.containsKey(value.hashCode());
    }

    public boolean isSubset(CustomSet<T> other) {
        for(Map.Entry<Integer, T> entry : other.elements.entrySet()) {
            if (!contains(entry.getValue()))
                return false;
        }

        return true;
    }

    public boolean isDisjoint(CustomSet<T> other) {
        for(Map.Entry<Integer, T> entry : other.elements.entrySet()) {
            if (contains(entry.getValue()))
                return false;
        }

        return true;
    }

    public CustomSet<T> getIntersection(CustomSet<T> other) {
        List<T> values = new LinkedList<>();

        elements.forEach((k, v) -> {
            if (other.contains(v))
                values.add(v);
        });

        return new CustomSet<T>(values);
    }

    public CustomSet<T> getDifference(CustomSet<T> other) {
        List<T> values = new LinkedList<>();

        elements.forEach((k, v) -> {
            if (!other.contains(v))
                values.add(v);
        });

        return new CustomSet<T>(values);
    }

    public CustomSet<T> getUnion(CustomSet<T> other) {
        List<T> values = new LinkedList<>(elements.values());
        values.addAll(other.elements.values());

        return new CustomSet<T>(values);
    }

    public boolean equals(Object other){
        if (other instanceof CustomSet<?>){
            if (((CustomSet<?>)other).elements.keySet().equals(elements.keySet())){
                return true;
            }
        }

        return false;
    }
}
