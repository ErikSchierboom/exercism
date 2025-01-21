using System.Linq;

public class Matrix
{
    private readonly int[][] _rows;
    private readonly int[][] _cols;

    public Matrix(string input)
    {
        _rows = Parse(input);
        _cols = Transpose(_rows);
    }
    
    public int[] Row(int row) => _rows[row - 1];
    public int[] Column(int col) => _cols[col - 1];

    private static int[][] Parse(string input) =>
        input.Split('\n')
            .Select(row => row.Split(' ').Select(int.Parse).ToArray())
            .ToArray();

    private static int[][] Transpose(int[][] matrix) =>
        Enumerable.Range(0, matrix.FirstOrDefault([]).Length)
            .Select(x => matrix.Select(y => y[x]).ToArray())
            .ToArray();
}