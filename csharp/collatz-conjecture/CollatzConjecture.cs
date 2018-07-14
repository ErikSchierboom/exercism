using System;

public static class CollatzConjecture
{
    public static int Steps(int number)
    {
        if (number <= 0)
        {
            throw new ArgumentException();
        }

        return Steps(number, 0);

        int Steps(int remainder, int stepCount)
        {
            if (remainder == 1)
            {
                return stepCount;
            }

            if (remainder % 2 == 0)
            {
                return Steps(remainder / 2, stepCount + 1);
            }

            return Steps(remainder * 3 + 1, stepCount + 1);
        }
    }
}
