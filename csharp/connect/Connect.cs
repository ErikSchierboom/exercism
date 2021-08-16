using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public enum ConnectWinner { White, Black, None }

public class Connect
{
    private enum Cell { Empty, White, Black }

    private readonly Cell[][] board;

    public Connect(string[] input) => board = ParseBoard(input);

    private static Cell CharToCell(char c) =>
        c switch
        {
            'O' => Cell.White,
            'X' => Cell.Black,
            _ => Cell.Empty
        };

    private static Cell[][] ParseBoard(string[] input) =>
        input.Select(str => Regex.Replace(str, @"\s+", ""))
            .Select(row => row.Select(CharToCell).ToArray())
            .ToArray();

    private int Cols => board[0].Length;
    private int Rows => board.Length;

    private bool IsValidCoordinate((int, int) coordinate) =>
        coordinate.Item2 >= 0 && coordinate.Item2 < Rows &&
        coordinate.Item1 >= 0 && coordinate.Item1 < Cols;

    private bool CellAtCoordinateEquals(Cell cell, (int, int) coordinate) => board[coordinate.Item2][coordinate.Item1] == cell;

    private HashSet<(int, int)> Adjacent(Cell cell, (int, int) coordinate)
    {
        var row = coordinate.Item2;
        var col = coordinate.Item1;

        var coords = new[]
        {
            (col + 1, row - 1),
            (col,     row - 1),
            (col - 1, row    ),
            (col + 1, row    ),
            (col - 1, row + 1),
            (col,     row + 1)
        };

        return coords.Where(coord => IsValidCoordinate(coord) && CellAtCoordinateEquals(cell, coord)).ToHashSet();
    }
    
    private bool ValidPath(Cell cell, Func<Cell[][], (int, int), bool> stop, HashSet<(int, int)> processed, (int, int) coordinate)
    {
        if (stop(board, coordinate))
            return true;

        var next = Adjacent(cell, coordinate);
        next.ExceptWith(processed);
        
        if (!next.Any())
            return false;

        return next.Any(nextCoord => {
            var updatedProcessed = new HashSet<(int, int)>(processed);
            updatedProcessed.Add(nextCoord);

            return ValidPath(cell, stop, updatedProcessed, nextCoord);
        });
    }   

    private bool IsWhiteStop(Cell[][] board, (int, int) coordinate) => coordinate.Item2 == Rows - 1;
    private bool IsBlackStop(Cell[][] board, (int, int) coordinate) => coordinate.Item1 == Cols - 1;

    private HashSet<(int, int)> WhiteStart() =>
        new(Enumerable.Range(0, Cols).Select(col => (col, 0)).Where(coord => CellAtCoordinateEquals(Cell.White, coord)));
        
    private HashSet<(int, int)> BlackStart() =>
        new(Enumerable.Range(0, Rows).Select(row => (0, row)).Where(coord => CellAtCoordinateEquals(Cell.Black, coord)));

    private bool ColorWins(Cell cell, Func<Cell[][], (int, int), bool> stop, Func<HashSet<(int, int)>> start) =>
        start().Any(coordinate => ValidPath(cell, stop, new HashSet<(int, int)>(), coordinate));

    private bool WhiteWins() => ColorWins(Cell.White, IsWhiteStop, WhiteStart);
    private bool BlackWins() => ColorWins(Cell.Black, IsBlackStop, BlackStart);        
    
    public ConnectWinner Result()
    {
        if (WhiteWins())
            return ConnectWinner.White;

        if (BlackWins())
            return ConnectWinner.Black;

        return ConnectWinner.None;
    }
}