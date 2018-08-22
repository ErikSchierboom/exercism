public class BinarySearch
{
    private readonly int[] _input;

    public BinarySearch(int[] input) => _input = input;

    public int Find(int value)
    {
        if (_input.Length == 0)
            return -1;

        return FindBetweenIndices(0, _input.Length - 1);

        int FindBetweenIndices(int minIndex, int maxIndex)
        {
            if (minIndex > maxIndex)
                return -1;
            
            var middleIndex = (minIndex + maxIndex) / 2;
            var valueAtMiddleIndex = _input[middleIndex];
            
            if (valueAtMiddleIndex == value)
                return middleIndex;

            return valueAtMiddleIndex > value
                ? FindBetweenIndices(minIndex, middleIndex - 1)
                : FindBetweenIndices(middleIndex + 1, maxIndex);
        }
    }
}