import java.util.LinkedList;
import java.util.List;

final class Flattener {

    public List<Object> flatten(List<Object> lists) {
        List<Object> flattened = new LinkedList<>();

        for (Object obj : lists) {
            if (obj instanceof List<?>)
                flattened.addAll(flatten((List<Object>)obj));
            else if (obj != null)
                flattened.add(obj);
        }

        return flattened;
    }
}
