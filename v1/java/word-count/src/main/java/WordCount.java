import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public final class WordCount {
    public Map<String, Integer> Phrase(String line) {
        return Stream.of(line.toLowerCase().split("\\W+"))
                     .collect(Collectors.toMap(
                        x -> x,
                        x -> 1,
                        Integer::sum));
    }
}