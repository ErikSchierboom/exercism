import java.util.Arrays;

public class PascalsTriangle {
    public static int[][] computeTriangle(int rows) {
        if (rows < 0) {
            throw new IllegalArgumentException();
        }

        int[][] triangle = new int[rows][];

        for (int i = 1; i <= rows; i++) {
            triangle[i - 1] = row(i);
        }

        return triangle;
    }

    public static boolean isTriangle(int[][] input) {
        int[][] triangle = computeTriangle(input.length);

        if (triangle.length != input.length) {
            return false;
        }

        for (int i = 0; i < triangle.length; i++) {
            if (!Arrays.equals(input[i], triangle[i])) {
                return false;
            }
        }

        return true;
    }

    private static int[] row(int rowNumber) {
        int[] row = new int[rowNumber];
        row[0] = 1;

        int column = 1;

        for (int j = 1; j < rowNumber; j++) {
            column = column * (rowNumber - j) / j;
            row[j] = column;
        }

        return row;
    }
}