import java.util.stream.IntStream;

public class Pangrams {

    public static boolean isPangram(String input) {
        String normalized = input.toLowerCase();

        return IntStream.rangeClosed('a', 'z')
                .mapToObj(c -> (char)c)
                .allMatch(c -> normalized.indexOf(c) != -1);
    }
}