import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class Crypto {
    private final String input;

    public Crypto(String input) {
        this.input = input;
    }

    public String getNormalizedPlaintext() {
        return this.input.toLowerCase()
                .chars()
                .mapToObj(c -> (char) c)
                .filter(Character::isLetterOrDigit)
                .map(Object::toString)
                .collect(Collectors.joining());
    }

    public int getSquareSize() {
        return (int) Math.ceil(Math.sqrt(this.getNormalizedPlaintext().length()));
    }

    public List<String> getPlaintextSegments() {
        return chunks(this.getNormalizedPlaintext(), this.getSquareSize());
    }

    public String getCipherText() {
        return String.join("", transpose(this.getPlaintextSegments()));
    }

    public String getNormalizedCipherText() {
        return String.join(" ", transpose(this.getPlaintextSegments()));
    }

    private static List<String> chunks(String str, int chunkSize) {
        int numberOfChunks = (int) Math.ceil(str.length() / (double) chunkSize);

        return IntStream.range(0, numberOfChunks)
                .mapToObj(i -> str.substring(i * chunkSize, Math.min(str.length(), i * chunkSize + chunkSize)))
                .collect(Collectors.toList());
    }

    private static List<String> transpose(List<String> input) {
        List<String> transposed = new LinkedList<>();;

        for (String str : input) {
            for (int j = 0; j < str.length(); j++) {
                char c = str.charAt(j);

                if (transposed.size() < j + 1) {
                    transposed.add("");
                }

                transposed.set(j, transposed.get(j) + c);
            }
        }

        return transposed;
    }
}
