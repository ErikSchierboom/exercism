using System;

public class Queen
{
    public Queen(int row, int column)
    {
        Row = row;
        Column = column;
    }

    public int Row { get; }
    public int Column { get; }
}

public static class QueenAttack
{
    public static bool CanAttack(Queen white, Queen black)
    {
        return black.Row == white.Row ||
               black.Column == white.Column ||
               Math.Abs(black.Row - white.Row) == Math.Abs(black.Column - white.Column);
    }

    public static Queen Create(int row, int column)
    {
        if (row < 0 || row > 7) throw new ArgumentOutOfRangeException(nameof(row));
        if (column < 0 || column > 7) throw new ArgumentOutOfRangeException(nameof(column));
        
        return new Queen(row, column);
    }
}