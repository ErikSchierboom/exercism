using System;

static class AssemblyLine
{
    private const int CarsPerHour = 221;

    public static double ProductionRatePerHour(int speed) =>
        SuccessRate(speed) * CarsPerHour * speed;
    
    private static double SuccessRate(int speed) =>
        speed switch
        {
            >= 1 and <= 4 => 1.0,
            >= 5 and <= 8 => 0.9,
            9 => 0.8,
            10 => 0.77,
            _ => 0.0
        };

    public static int WorkingItemsPerMinute(int speed) =>
        (int) (ProductionRatePerHour(speed) / 60);
}
