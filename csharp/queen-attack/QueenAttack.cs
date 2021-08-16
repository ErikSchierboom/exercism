using System;

public static class QueenAttack
{
    public static bool CanAttack((int Row, int Col) white, (int Row, int Col) black) =>
        black.Row == white.Row ||
        black.Col == white.Col ||
        Math.Abs(black.Row - white.Row) == Math.Abs(black.Col - white.Col);

    public static (int Row, int Col) Create(int row, int column)
    {
        if (row is < 0 or > 7) throw new ArgumentOutOfRangeException(nameof(row));
        if (column is < 0 or > 7) throw new ArgumentOutOfRangeException(nameof(column));
        
        return (row, column);
    }
}