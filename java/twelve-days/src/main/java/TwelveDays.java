import java.security.InvalidParameterException;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class TwelveDays {
    private static String cardinal(int number, int verse) {
        switch(number) {
            case 1: return verse == 1 ? "a" : "and a";
            case 2: return "two";
            case 3: return "three";
            case 4: return "four";
            case 5: return "five";
            case 6: return "six";
            case 7: return "seven";
            case 8: return "eight";
            case 9: return "nine";
            case 10: return "ten";
            case 11: return "eleven";
            case 12: return "twelve";
            default: throw new InvalidParameterException();
        }
    }

    private static String ordinal(int number) {
        switch(number) {
            case 1: return "first";
            case 2: return "second";
            case 3: return "third";
            case 4: return "fourth";
            case 5: return "fifth";
            case 6: return "sixth";
            case 7: return "seventh";
            case 8: return "eighth";
            case 9: return "ninth";
            case 10: return "tenth";
            case 11: return "eleventh";
            case 12: return "twelfth";
            default: throw new InvalidParameterException();
        }
    }

    private static String subject(int index) {
        switch(index) {
            case 1: return "Partridge in a Pear Tree";
            case 2: return "Turtle Doves";
            case 3: return "French Hens";
            case 4: return "Calling Birds";
            case 5: return "Gold Rings";
            case 6: return "Geese-a-Laying";
            case 7: return "Swans-a-Swimming";
            case 8: return "Maids-a-Milking";
            case 9: return "Ladies Dancing";
            case 10: return "Lords-a-Leaping";
            case 11: return "Pipers Piping";
            case 12: return "Drummers Drumming";
            default: throw new InvalidParameterException();
        }
    }

    private static String indexedSubject(int index, int verse) {
        return String.format("%s %s", cardinal(index, verse), subject(index));
    }

    private static String subjects(int verse) {
        return IntStream
            .rangeClosed(1, verse)
                .mapToObj(i -> indexedSubject(verse - i + 1, verse))
                .collect(Collectors.joining(", "));
    }

    public static String verse(int number) {
        return String.format("On the %s day of Christmas my true love gave to me, %s.\n", ordinal(number), subjects(number));
    }

    public static String verses(int start, int stop) {
        return IntStream
            .rangeClosed(start, stop)
            .mapToObj(TwelveDays::verse)
            .collect(Collectors.joining("\n"));
    }

    public static String sing() {
        return verses(1, 12);
    }
}
