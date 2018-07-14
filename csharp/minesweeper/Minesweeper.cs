using System.Collections.Generic;
using System.Drawing;
using System.Linq;

public enum CellType
{
    Mine,
    Empty
}

public static class Minesweeper
{
    private const char MineCell = '*';
    private const char EmptyCell = ' ';

    public static string Annotate(string input)
    {
        var grid = ParseGrid(input);
        var rows = Enumerable.Range(0, Rows(grid)).Select(row => AnnotateRow(row, grid));
        return string.Join("\n", rows);
    }

    private static string AnnotateRow(int row, CellType[][] grid)
    {
        return new string(Enumerable.Range(0, Cols(grid)).Select(col => AnnotateCell(new Point(col, row), grid)).ToArray());
    }

    private static char AnnotateCell(Point point, CellType[][] grid)
    {
        var cell = Cell(point, grid);

        if (cell == CellType.Mine)
        {
            return MineCell;
        }

        var neighboringMines = NeighboringMines(point, grid);
        return neighboringMines == 0 ? EmptyCell : neighboringMines.ToString()[0];
    }

    private static CellType[][] ParseGrid(string input) => input.Split('\n').Select(ParseRow).ToArray();

    private static CellType[] ParseRow(string row) => row.Select(ParseCell).ToArray();

    private static CellType ParseCell(char cell) => cell == MineCell ? CellType.Mine : CellType.Empty;

    private static int NeighboringMines(Point point, CellType[][] grid) => 
        NeighboringPositions(point)
            .Count(neighboringPoint => IsValidPosition(neighboringPoint, grid) && Cell(neighboringPoint, grid) == CellType.Mine);

    private static IEnumerable<Point> NeighboringPositions(Point point)
    {
        return new[]
        {
            new Point(point.X - 1, point.Y - 1), new Point(point.X - 1, point.Y), new Point(point.X - 1, point.Y + 1),
            new Point(point.X    , point.Y - 1), new Point(point.X    , point.Y), new Point(point.X    , point.Y + 1),
            new Point(point.X + 1, point.Y - 1), new Point(point.X + 1, point.Y), new Point(point.X + 1, point.Y + 1)
        };
    }

    private static bool IsValidPosition(Point point, CellType[][] grid) =>
        point.Y >= 0 && point.Y < Rows(grid) &&
        point.X >= 0 && point.X < Cols(grid);

    private static int Rows(CellType[][] grid) => grid.Length;

    private static int Cols(CellType[][] grid) => grid[0].Length;

    private static CellType Cell(Point point, CellType[][] grid) => grid[point.Y][point.X];
}