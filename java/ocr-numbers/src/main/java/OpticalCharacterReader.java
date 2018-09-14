import java.awt.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

final class OpticalCharacterReader {
    private final int CharacterWidth = 3;
    private final int CharacterHeight = 4;

    private final Map<String, String> CharactersMap = getCharactersMap();
    private List<String> lines;

    public String parse(List<String> lines) {
        this.lines = lines;

        if (lines.size() % CharacterHeight != 0) {
            throw new IllegalArgumentException("Number of input rows must be a positive multiple of 4");
        }

        if (lines.get(0).length() % CharacterWidth != 0) {
            throw new IllegalArgumentException("Number of input columns must be a positive multiple of 3");
        }

        int x = this.horizontalCharacters();
        int y = this.verticalCharacters();

        return IntStream.range(0, verticalCharacters())
            .mapToObj(this::rowCharacters)
            .collect(Collectors.joining(","));
    }

    private String rowCharacters(int row) {
        return IntStream.range(0, horizontalCharacters())
                .mapToObj(x -> new Point(x, row))
                .map(this::convertCharacter)
                .collect(Collectors.joining(""));
    }

    private int horizontalCharacters() {
        return lines.get(0).length() / CharacterWidth;
    }

    private int verticalCharacters() {
        return lines.size() / CharacterHeight;
    }

    private String convertCharacter(Point point) {
      return matchCharacter(character(point));
    }

    private String character(Point point) {
        return IntStream.range(0, CharacterHeight)
                .mapToObj(offset -> characterOnLine(point, offset))
                .collect(Collectors.joining(""));
    }

    private String characterOnLine(Point point, Integer offset) {
        String completeLine = lines.get(point.y * CharacterHeight + offset);
        return completeLine.substring(point.x * CharacterWidth, point.x * CharacterWidth + CharacterWidth);
    }

    private String matchCharacter(String character) {
        return CharactersMap.getOrDefault(character, "?");
    }

    private static Map<String, String> getCharactersMap() {

        Map<String, String> map = new HashMap<>();
        map.put(" _ " +
                "| |" +
                "|_|" +
                "   ",
                "0");
        map.put("   " +
                "  |" +
                "  |" +
                "   ",
                "1");
        map.put(" _ " +
                " _|" +
                "|_ " +
                "   ",
                "2");
        map.put(" _ " +
                " _|" +
                " _|" +
                "   ",
                "3");
        map.put("   " +
                "|_|" +
                "  |" +
                "   ",
                "4");
        map.put(" _ " +
                "|_ " +
                " _|" +
                "   ",
                "5");
        map.put(" _ " +
                "|_ " +
                "|_|" +
                "   ",
                "6");
        map.put(" _ " +
                "  |" +
                "  |" +
                "   ",
                "7");
        map.put(" _ " +
                "|_|" +
                "|_|" +
                "   ",
                "8");
        map.put(" _ " +
                "|_|" +
                " _|" +
                "   ",
                "9");
        return map;
    }
}