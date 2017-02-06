import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

final class DiamondPrinter {
    public List<String> printToList(char c) {

        List<String> lines = new LinkedList<>();

        int letterCount = c - 'A' + 1;

        for (int i = 0; i < letterCount; i++)
            lines.add(makeLine((char)('A' + i), i, letterCount));

        for (int i = 1; i < letterCount; i++)
            lines.add(makeLine((char)(c - i), letterCount - i - 1, letterCount));

        return lines;
    }

    private static String makeLine(char letter, int row, int letterCount) {
        String outerSpaces = createSpaces(letterCount - row - 1);
        String innerSpaces = createSpaces(row == 0 ? 0 : row * 2 - 1);

        if (letter == 'A')
            return String.format("%s%s%s", outerSpaces, letter, outerSpaces);

        return String.format("%s%s%s%s%s", outerSpaces, letter, innerSpaces, letter, outerSpaces);
    }

    private static String createSpaces(int length) {
        if (length <= 0) {
            return "";
        }

        char[] array = new char[length];
        Arrays.fill(array, ' ');
        return new String(array);
    }
}
