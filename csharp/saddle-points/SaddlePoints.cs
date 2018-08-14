using System;
using System.Collections.Generic;
using System.Linq;

public class SaddlePoints
{
    private readonly int[,] values;
    private readonly int[] maxRows;
    private readonly int[] minCols;

    public SaddlePoints(int[,] values)
    {
        this.values = values;
        maxRows = Rows().Select(r => r.Max()).ToArray();
        minCols = Columns().Select(r => r.Min()).ToArray();
    }

    public IEnumerable<Tuple<int, int>> Calculate() => Coordinates().Where(IsSaddlePoint);

    private bool IsSaddlePoint(Tuple<int, int> coordinate)
     => maxRows[coordinate.Item1] == values[coordinate.Item1, coordinate.Item2] &&
        minCols[coordinate.Item2] == values[coordinate.Item1, coordinate.Item2];

    private IEnumerable<Tuple<int, int>> Coordinates()
        => Enumerable
            .Range(0, RowCount)
            .SelectMany(x => Enumerable.Range(0, ColumnCount)
            .Select(y => Tuple.Create(x, y)));

    private IEnumerable<IEnumerable<int>> Rows()
        => Enumerable
            .Range(0, RowCount)
            .Select(x => Enumerable.Range(0, ColumnCount).Select(y => values[x, y]));

    private IEnumerable<IEnumerable<int>> Columns()
        => Enumerable
            .Range(0, ColumnCount)
            .Select(y => Enumerable.Range(0, RowCount).Select(x => values[x, y]));

    private int ColumnCount => values.GetLength(1);

    private int RowCount => values.GetLength(0);
}