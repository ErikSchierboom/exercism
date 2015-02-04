import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public final class Robot {

    private final static Integer NumberOfLetters = 2;
    private final static Integer NumberOfDigits = 3;

    private final static String Letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private final static String Digits = "0123456789";

    private final static Random random = new Random();

    private String name;

    public Robot() {
        this.name = generateName();
    }

    public String getName() {
        return this.name;
    }

    public void reset() {
        this.name = generateName();
    }

    private static String generateName() {
        return Stream.concat(randomLetters().limit(NumberOfLetters), randomDigits().limit(NumberOfDigits)).collect(Collectors.joining());
    }

    private static Stream<String> randomLetters() {
        return randomCharacters(Letters);
    }

    private static Stream<String> randomDigits() {
        return randomCharacters(Digits);
    }

    private static Stream<String> randomCharacters(String str) {
        return Stream.generate(() -> randomCharacter(str));
    }

    private static String randomCharacter(String str) {
        return Character.toString(str.charAt(random.nextInt(str.length())));
    }
}