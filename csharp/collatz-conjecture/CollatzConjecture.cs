using System;

public static class CollatzConjecture
{
    public static int Steps(int number)
    {
        if (number <= 0) throw new ArgumentException(nameof(number));

        var remainder = number;
        var stepCount = 0;

        while (remainder != 1)
        {
            remainder = remainder % 2 == 0 ? remainder / 2 : remainder * 3 + 1;
            stepCount++;
        }

        return stepCount;
    }
}
