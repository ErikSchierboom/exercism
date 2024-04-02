import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

class ParallelLetterFrequency {
    private final String[] texts;

    ParallelLetterFrequency(String[] texts) {
        this.texts = texts;
    }

    Map<Character, Integer> countLetters() {
        return Arrays.stream(texts)
                .parallel()
                .map(this::countLetters)
                .reduce(new HashMap<>(), this::combine);
    }

    private Map<Character, Integer> countLetters(String text) {
        Map<Character, Integer> counts = new HashMap<>();

        for (var c: text.toCharArray()) {
            if (!Character.isLetter(c))
                continue;

            counts.merge(Character.toLowerCase(c), 1, Integer::sum);
        }

        return counts;
    }

    private Map<Character, Integer> combine(Map<Character, Integer> map, Map<Character, Integer> acc) {
        for (var entry: map.entrySet()) {
            acc.merge(entry.getKey(), entry.getValue(), Integer::sum);
        }

        return acc;
    }
}
