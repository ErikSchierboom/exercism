public class Clock {
    private int normalizedHours;
    private int normalizedMinutes;

    public Clock(int hours, int minutes) {
        update(hours * 60 + minutes);
    }

    public void add(int minutes) {
        update(normalizedHours * 60 + normalizedMinutes + minutes);
    }

    @Override
    public String toString() {
        return String.format("%02d:%02d", normalizedHours, normalizedMinutes);
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (!Clock.class.isAssignableFrom(obj.getClass())) {
            return false;
        }
        final Clock other = (Clock) obj;
        return other.normalizedHours == normalizedHours && other.normalizedMinutes == normalizedMinutes;
    }

    private void update(int totalMinutes) {
        normalizedHours = mod(totalMinutes / 60.0, 24);
        normalizedMinutes = mod(totalMinutes, 60);
    }

    private static int mod(double x, int y) {
        return (int)(x % (double)y + y) % y;
    }
}
