import java.util.List;

public class PythagoreanTriplet {
    private final int x;
    private final int y;
    private final int z;

    public PythagoreanTriplet(int x, int y, int z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public long calculateProduct() {
        return x * y * z;
    }

    public int calculateSum() {
        return x + y + z;
    }

    public boolean isPythagorean() {
        return x * x + y * y == z * z;
    }

    public static PythagoreanTripletBuilder makeTripletsList() {
        return new PythagoreanTripletBuilder();
    }
}