import java.util.Arrays;
import java.util.stream.IntStream;

public class Matrix {
    private final int[][] rows;
    private final int[][] cols;

    public Matrix(String matrixAsString) {
        rows = ParseRows(matrixAsString);
        cols = ParseCols(rows);
    }

    public int[] getRow(int i) {
        return rows[i];
    }

    public int[] getColumn(int i) {
        return cols[i];
    }

    public int getRowsCount() {
        return rows.length;
    }

    public int getColumnsCount() {
        return cols.length;
    }

    private static int[][] ParseRows(String input) {
        return Arrays.stream(input.split("\n"))
                .map(Matrix::ParseRow)
                .toArray(int[][]::new);
    }

    private static int[] ParseRow(String row) {
        return Arrays.stream(row.split(" "))
                .mapToInt(Integer::parseInt)
                .toArray();
    }

    private static int[][] ParseCols(int[][] rows) {
        return IntStream.range(0, rows[0].length)
                .mapToObj(y -> ParseCol(rows, y))
                .toArray(int[][]::new);
    }

    private static int[] ParseCol(int[][] rows, int y) {
        return IntStream.range(0, rows.length)
                .map(x -> rows[x][y])
                .toArray();
    }
}
