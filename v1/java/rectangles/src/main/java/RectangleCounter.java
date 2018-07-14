import java.awt.*;
import java.util.Arrays;
import java.util.function.Supplier;
import java.util.stream.IntStream;
import java.util.stream.Stream;

final class RectangleCounter {

    public int countRectangles(String[] inputGrid) {
        CellType[][] grid = ParseGrid(inputGrid);
        Point[] corners = FindCorners(grid);
        return Arrays
                .stream(corners)
                .mapToInt(corner -> RectangleForCorner(corner, corners, grid))
                .sum();
    }

    private static CellType[][] ParseGrid(String[] rows) {
        return Arrays.stream(rows)
            .map(row ->
                    row.chars()
                        .mapToObj(c -> ParseCell((char)c))
                        .toArray(CellType[]::new)
                )
                .toArray(CellType[][]::new);
    }

    private static CellType ParseCell(char cell) {
        switch (cell) {
            case '+':
                return CellType.Corner;
            case '-':
                return CellType.HorizontalLine;
            case '|':
                return CellType.VerticalLine;
            default:
                return CellType.Empty;
        }
    }

    private static int Rows(CellType[][] grid) {
        return grid.length;
    }

    private static int Cols(CellType[][] grid) {
        return grid[0].length;
    }

    private static CellType Cell(Point point, CellType[][] grid) {
        return grid[(int)point.getY()][(int)point.getX()];
    }

    private static Point[] FindCorners(CellType[][] grid) {
        return IntStream.range(0, Rows(grid))
                .boxed()
                .flatMap(y ->
                    IntStream.range(0, Cols(grid))
                    .boxed()
                    .map(x -> new Point(x, y))
                )
                .filter(point -> Cell(point, grid) == CellType.Corner)
                .toArray(Point[]::new);
    }

    private static Boolean ConnectsVertically(Point point, CellType[][] grid) {
        return Cell(point, grid) == CellType.VerticalLine || Cell(point, grid) == CellType.Corner;
    }            

    private static Boolean ConnectedVertically(Point top, Point bottom, CellType[][] grid) {
        return IntStream.rangeClosed((int)top.getY() + 1, (int)bottom.getY() - 1)
                .allMatch(y -> ConnectsVertically(new Point((int)top.getX(), y), grid));
    }

    private static boolean ConnectsHorizontally(Point point, CellType[][] grid) {
        return Cell(point, grid) == CellType.HorizontalLine || Cell(point, grid) == CellType.Corner;
    }

    private static boolean ConnectedHorizontally(Point left, Point right, CellType[][] grid) {
        return IntStream.rangeClosed((int)left.getX() + 1, (int)right.getX() - 1)
                .allMatch(x -> ConnectsHorizontally(new Point(x, (int)left.getY()), grid));
    }

    private static boolean IsTopLineOfRectangle(Point topLeft, Point topRight, CellType[][] grid) {
        return topRight.getX() > topLeft.getX() &&
               topRight.getY() == topLeft.getY() &&
               ConnectedHorizontally(topLeft, topRight, grid);
    }

    private static boolean IsRightLineOfRectangle(Point topRight, Point bottomRight, CellType[][] grid) {
        return bottomRight.getX() == topRight.getX() &&
               bottomRight.getY() > topRight.getY() &&
               ConnectedVertically(topRight, bottomRight, grid);
    }

    private static boolean IsBottomLineOfRectangle(Point bottomLeft, Point bottomRight, CellType[][] grid) {
        return bottomRight.getX() > bottomLeft.getX() &&
               bottomRight.getY() == bottomLeft.getY() &&
               ConnectedHorizontally(bottomLeft, bottomRight, grid);
    }

    private static boolean IsLeftLineOfRectangle(Point topLeft, Point bottomLeft, CellType[][] grid) {
        return bottomLeft.getX() == topLeft.getX() &&
               bottomLeft.getY() > topLeft.getY() &&
               ConnectedVertically(topLeft, bottomLeft, grid);
    }

    private static int RectangleForCorner(Point topLeft, Point[] corners, CellType[][] grid) {
        Supplier<Stream<Point>> topRight = () -> Arrays.stream(corners).filter(corner -> IsTopLineOfRectangle(topLeft, corner, grid));
        Supplier<Stream<Point>> bottomLeft = () -> Arrays.stream(corners).filter(corner -> IsLeftLineOfRectangle(topLeft, corner, grid));

        return (int)Arrays.stream(corners)
                .filter(corner ->
                        topRight.get().anyMatch(topRightPoint -> IsRightLineOfRectangle(topRightPoint, corner, grid)) &&
                        bottomLeft.get().anyMatch(bottomLeftPoint -> IsBottomLineOfRectangle(bottomLeftPoint, corner, grid)))
                .count();
    }

    private enum CellType {
        Empty,
        Corner,
        HorizontalLine,
        VerticalLine
    }
}
