import java.util.Random;
import java.util.function.BiFunction;

public class Cipher {
    private static final String LETTERS = "abcdefghijklmnopqrstuvwxyz";
    private static final int KEY_LENGTH = 100;

    private static final Random random = new Random();

    private final String key;

    public Cipher() {
        this.key = generateKey();
    }

    public Cipher(String key) {
        if (!key.matches("^[a-z]+$")) {
            throw new IllegalArgumentException();
        }

        this.key = key;
    }

    public String getKey() {
        return key;
    }

    public String encode(String input) {
        String encoded = "";

        for (int i = 0; i < input.length(); i++) {
            encoded += encode(input.charAt(i), i);
        }

        return encoded;
    }

    public String decode(String encoded) {
        String decoded = "";

        for (int i = 0; i < encoded.length(); i++) {
            decoded += decode(encoded.charAt(i), i);
        }

        return decoded;
    }

    private char encode(char c, int i) {
        return this.shift(c, i, (character, shift) -> character + shift);
    }

    private char decode(char c, int i) {
        return this.shift(c, i, (character, shift) -> character - shift);
    }

    private char shift(char c, int i, BiFunction<Integer, Integer, Integer> shiftCharacter) {
        return (char) ('a' + this.getCharacterShiftValue(c, i, shiftCharacter));
    }

    private int getCharacterShiftValue(char c, int i, BiFunction<Integer, Integer, Integer> shiftCharacter) {
        return mod(shiftCharacter.apply(normalizeCharacter(c), this.getShiftValue(i)), LETTERS.length());
    }

    private static int normalizeCharacter(int c) {
        return c - 'a';
    }

    private int getShiftValue(int i) {
        return this.key.charAt(i) % 'a';
    }

    private static int mod(int x, int y) {
        return ((x % y) + y) % y;
    }

    private static String generateKey() {
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < KEY_LENGTH; i++) {
            int index = random.nextInt(26);
            sb.append(LETTERS.charAt(index));
        }

        return sb.toString();
    }
}