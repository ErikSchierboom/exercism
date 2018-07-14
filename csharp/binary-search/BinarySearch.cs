using System;

public class BinarySearch
{
    private readonly int[] _input;

    public BinarySearch(int[] input) => _input = input;

    public int Find(int value)
    {
        if (_input.Length == 0)
        {
            return -1;
        }

        return FindBetweenIndices(0, _input.Length - 1);

        int FindBetweenIndices(int minIndex, int maxIndex)
        {
            var middleIndex = (minIndex + maxIndex) / 2;

            if (_input[middleIndex] == value)
            {
                return middleIndex;
            }

            if (middleIndex <= 0 || middleIndex >= _input.Length - 1 || minIndex >= maxIndex)
            {
                return -1;
            }

            return _input[middleIndex] > value
                ? FindBetweenIndices(minIndex, middleIndex - 1)
                : FindBetweenIndices(middleIndex + 1, maxIndex);
        }
    }
}