using System;

public static class BinarySearch
{
    public static int Find(Span<int> array, int value, int offset = 0)
    {
        if (array.Length == 0)
            return -1;
        
        var middleIndex = array.Length / 2;
        var middleValue = array[middleIndex];
            
        if (middleValue == value)
            return offset + middleIndex;

        return middleValue > value
            ? Find(array.Slice(0, middleIndex), value, offset)
            : Find(array.Slice(middleIndex + 1), value, offset + middleIndex + 1);
    }
}