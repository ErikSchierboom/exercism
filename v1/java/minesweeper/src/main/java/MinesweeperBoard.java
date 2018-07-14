import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public final class MinesweeperBoard {
    private final List<String> inputBoard;
    private final int rows;
    private final int cols;

    public MinesweeperBoard(List<String> inputBoard) {
        if (inputBoard == null) {
            throw new IllegalArgumentException("Input board may not be null.");
        }
        if (!inputBoard.stream().allMatch(row -> row.chars().allMatch(c -> c == ' ' || c == '*'))) {
            throw new IllegalArgumentException("Input board can only contain the characters ' ' and '*'.");
        }

        this.rows = inputBoard.size();
        this.cols = this.rows == 0 ? 0 : inputBoard.get(0).length();

        if (!inputBoard.stream().allMatch(row -> row.length() == this.cols)) {
            throw new IllegalArgumentException("Input board rows must all have the same number of columns.");
        }

        this.inputBoard = inputBoard;
    }

    public List<String> getAnnotatedRepresentation() {
        return IntStream.range(0, this.rows)
                .mapToObj(y -> IntStream.range(0, this.cols)
                            .mapToObj(x -> getAnnotatedCell(x, y))
                            .collect(Collectors.joining("")))
                .collect(Collectors.toList());
    }

    private String getAnnotatedCell(int x, int y) {
        if (inputBoard.get(y).charAt(x) == '*') {
            return "*";
        }

        int count = getCountForCell(x, y);
        return count == 0 ? " " : Integer.toString(count);
    }

    private int getCountForCell(int x, int y)
    {
        int result = 0;

        for (int i = -1; i <= 1; i++)
        {
            for (int j = -1; j <= 1; j++)
            {
                try
                {
                    if (inputBoard.get(y + i).charAt(x + j) == '*')
                    {
                        result++;
                    }
                }
                catch (Exception ex)
                {
                }
            }
        }

        return result;
    }
}
