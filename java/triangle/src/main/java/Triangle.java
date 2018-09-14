public class Triangle {
    private final TriangleKind kind;

    public Triangle(int x, int y, int z) throws TriangleException {
        this.kind = determineKind(x, y, z);
    }

    public Triangle(double x, double y, double z) throws TriangleException {
        this.kind = determineKind(x, y, z);
    }

    public TriangleKind getKind() {
        return this.kind;
    }

    private static TriangleKind determineKind(double x, double y, double z) throws TriangleException {
        if (x == 0 && y == 0 && z == 0)
        {
            throw new TriangleException();
        }

        if (x < 0 || y < 0 || z < 0)
        {
            throw new TriangleException();
        }

        if (x + y <= z || x + z <= y || y + z <= x)
        {
            throw new TriangleException();
        }

        if (x == y && y == z)
        {
            return TriangleKind.EQUILATERAL;
        }

        if (x == y || x == z || y == z)
        {
            return TriangleKind.ISOSCELES;
        }

        return TriangleKind.SCALENE;
    }
}