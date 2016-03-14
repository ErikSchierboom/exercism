import java.util.Set;
import java.util.stream.Collectors;

public class Pangrams {

    private static final Set<Character> alphabet = "abcdefghijklmnopqrstuvwxyz".chars()
                                                                               .mapToObj(c -> (char)c)
                                                                               .collect(Collectors.toSet());
    
    public static boolean isPangram(String input) {
        String normalized = input.toLowerCase();

        return alphabet.stream().allMatch(c -> normalized.contains(c.toString()));
    }
}
