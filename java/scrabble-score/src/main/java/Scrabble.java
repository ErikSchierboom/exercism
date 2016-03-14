import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class Scrabble {
    private static Map<Character, Integer> letterScores = getLetterScores();
    private int score;

    public Scrabble(String input) {
        this.score = normalize(input)
                          .chars()
                          .mapToObj(c -> (char)c)
                          .mapToInt(Scrabble::letterScore)
                          .sum();
    }

    public int getScore() {
        return score;
    }

    private static String normalize(String input) {
        return input == null ? "" : input.toUpperCase();
    }

    private static int letterScore(char letter) {
        return letterScores.getOrDefault(letter, 0);
    }

    private static Map<Character, Integer> getLetterScores() {
        final Map<Character, Integer> letterScores = new HashMap<Character, Integer>();
        letterScores.put('A', 1);
        letterScores.put('B', 3);
        letterScores.put('C', 3);
        letterScores.put('D', 2);
        letterScores.put('E', 1);
        letterScores.put('F', 4);
        letterScores.put('G', 2);
        letterScores.put('H', 4);
        letterScores.put('I', 1);
        letterScores.put('J', 8);
        letterScores.put('K', 5);
        letterScores.put('L', 1);
        letterScores.put('M', 3);
        letterScores.put('N', 1);
        letterScores.put('O', 1);
        letterScores.put('P', 3);
        letterScores.put('Q', 10);
        letterScores.put('R', 1);
        letterScores.put('S', 1);
        letterScores.put('T', 1);
        letterScores.put('U', 1);
        letterScores.put('V', 4);
        letterScores.put('W', 4);
        letterScores.put('X', 8);
        letterScores.put('Y', 4);
        letterScores.put('Z', 10);

        return Collections.unmodifiableMap(letterScores);
    }
}
