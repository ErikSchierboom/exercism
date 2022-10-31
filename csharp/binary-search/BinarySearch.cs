public static class BinarySearch
{
    public static int Find(int[] array, int value)
    {
        if (array.Length == 0)
            return -1;

        return FindBetweenIndices(0, array.Length - 1);

        int FindBetweenIndices(int minIndex, int maxIndex)
        {
            if (minIndex > maxIndex)
                return -1;
            
            var middleIndex = (minIndex + maxIndex) / 2;
            var valueAtMiddleIndex = array[middleIndex];
            
            if (valueAtMiddleIndex == value)
                return middleIndex;

            return valueAtMiddleIndex > value
                ? FindBetweenIndices(minIndex, middleIndex - 1)
                : FindBetweenIndices(middleIndex + 1, maxIndex);
        }
    }
}