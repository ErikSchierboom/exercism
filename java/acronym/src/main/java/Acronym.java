import java.util.Arrays;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Acronym {
    public static String generate(String phrase) {
        return getWords(phrase)
                    .map(Acronym::getAcronymCharacters)
                    .collect(Collectors.joining(""));
    }

    private static Stream<String> getWords(String phrase) {
        return Arrays.stream(phrase.split("[\\p{Punct}\\s]+"));
    }

    private static String getAcronymCharacters(String word) {
        if (word.toLowerCase().equals(word)|| word.toUpperCase().equals(word)) {
            return word.toUpperCase().substring(0, 1);
        }

        return word.chars()
                   .mapToObj(c -> (char)c)
                   .filter(Character::isUpperCase)
                   .map(Object::toString)
                   .collect(Collectors.joining(""));
    }
}