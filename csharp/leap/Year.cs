namespace Exercism
{
    public static class Year
    {
        public static bool IsLeap(uint year)
        {
            return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
        }
    }
}