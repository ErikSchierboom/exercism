import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Atbash {
    private final static int BLOCK_SIZE = 5;
    private final static String PLAIN  = "abcdefghijklmnopqrstuvwxyz0123456789";
    private final static String CIPHER = "zyxwvutsrqponmlkjihgfedcba0123456789";

    public static String encode(String words) {
        String encoded = getValidCharacters(words).map(Atbash::encode).collect(Collectors.joining());

        return toBlocks(encoded);
    }

    public static String decode(String input) {
        return input.toLowerCase()
                .replace(" ", "")
                .chars()
                .mapToObj(c -> (char) c)
                .map(Atbash::decode)
                .collect(Collectors.joining());
    }

    private static Stream<Character> getValidCharacters(String words) {
         return words.toLowerCase()
                .chars()
                .mapToObj(c -> (char) c)
                .filter(Character::isLetterOrDigit);
    }

    private static String encode(Character c) {
        return Character.toString(CIPHER.charAt(PLAIN.indexOf(c)));
    }

    private static String decode(Character c) {
        return Character.toString(PLAIN.charAt(CIPHER.indexOf(c)));
    }

    private static String toBlocks(String encoded) {
        List<String> blocks = new LinkedList<>();

        for (int i = 0; i < encoded.length(); i += BLOCK_SIZE) {
            blocks.add(encoded.substring(i, Math.min(encoded.length(), i + BLOCK_SIZE)));
        }

        return String.join(" ", blocks);
    }
}
