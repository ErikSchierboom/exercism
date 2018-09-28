using System;

public class SpiralMatrix
{
    public static int[,] GetMatrix(int size)
    {
        var matrix = new int[size, size];
        
        var rowOffset = 0;
        var columnOffset = 0;

        var totalNumbers = size * size;
        var currentNumber = 1;

        while (currentNumber <= totalNumbers)
        {
            for (var topColumn = columnOffset; topColumn < size - columnOffset; topColumn++)
                matrix[rowOffset, topColumn] = currentNumber++;
            
            for (var rightRow = rowOffset + 1; rightRow < size - rowOffset; rightRow++)
                matrix[rightRow, size - columnOffset - 1] = currentNumber++;

            for (var bottomColumn = size - columnOffset - 2; bottomColumn >= columnOffset; bottomColumn--)
                matrix[size - rowOffset - 1, bottomColumn] = currentNumber++;
            
            for (var leftRow = size - rowOffset - 2; leftRow >= rowOffset + 1; leftRow--)
                matrix[leftRow, columnOffset] = currentNumber++;

            rowOffset += 1;
            columnOffset += 1;
        }

        return matrix;
    }
}
