import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Etl {
    public Map<String, Integer> transform(Map<Integer, List<String>> input) {
        return input.entrySet()
                    .stream()
                    .map(scoreLetters -> scoreLetters.getValue()
                            .stream()
                            .collect(Collectors.toMap(String::toLowerCase, letter -> scoreLetters.getKey())))
                    .collect(HashMap::new, Map::putAll, Map::putAll);
    }
}