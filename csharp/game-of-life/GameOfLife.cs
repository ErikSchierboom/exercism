using System;

public static class GameOfLife
{
    public static int[,] Tick(int[,] matrix)
    {
        var board = new int[matrix.GetLength(0), matrix.GetLength(1)];

        for (var row = 0; row < matrix.GetLength(0); row++)
        {
            for (var col = 0; col < matrix.GetLength(1); col++)
            {
                var liveNeighbors = 0;
                
                for (var i = -1; i <= 1; i++)
                {
                    for (var j = -1; j <= 1; j++)
                    {
                        if (i == 0 && j == 0) continue;

                        var newRow = row + i;
                        var newCol = col + j;

                        if (newRow < 0 || newRow >= matrix.GetLength(0) || newCol < 0 || newCol >= matrix.GetLength(1))
                            continue;

                        if (matrix[newRow, newCol] == 1)
                            liveNeighbors++;
                    }
                }
                
                if (matrix[row,col] == 1 && liveNeighbors is >= 2 and <= 3 ||
                    matrix[row,col] == 0 && liveNeighbors == 3)
                    board[row,col] = 1;
            }    
        }

        return board;
    }
}
