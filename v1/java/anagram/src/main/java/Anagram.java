import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public final class Anagram {
    private final String normalizedSource;

    public Anagram(String source) {
        this.normalizedSource = normalizeSource(source);
    }

    public List<String> match(List<String> inputs) {
        return inputs.stream()
                .filter(s -> normalizeSource(s).equals(this.normalizedSource))
                .collect(Collectors.toList());
    }

    private static String normalizeSource(String source) {
        char[] characters = source.toLowerCase().toCharArray();
        Arrays.sort(characters);

        return new String(characters);
    }
}