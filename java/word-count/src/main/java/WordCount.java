import java.util.Map;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public final class WordCount {
    public Map<String, Integer> Phrase(String line) {
        return words(line).collect(Collectors.groupingBy(word -> word, Collectors.counting()))
                .entrySet()
                .stream()
                .collect(Collectors.toMap(c -> c.getKey(), c -> c.getValue().intValue()));
    }

    private Stream<String> words(String line) {
        Pattern wordsRegex = Pattern.compile("[^\\w]");
        return wordsRegex.splitAsStream(line.toLowerCase()).filter(s -> !s.isEmpty());
    }
}