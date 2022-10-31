public static class Triangle
{
    public static bool IsScalene(double x, double y, double z) =>
        IsValid(x, y, z) && (x != y && y != z && x != z);

    public static bool IsIsosceles(double x, double y, double z) =>
        IsValid(x, y, z) && (x == y || y == z || x == z);

    public static bool IsEquilateral(double x, double y, double z) =>
        IsValid(x, y, z) && x == y && y == z;

    private static bool IsValid(double x, double y, double z) =>
        x != 0 && y != 0 && z != 0 &&
        x + y >= z && x + z >= y && y + z >= x;
}