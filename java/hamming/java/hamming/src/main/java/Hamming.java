public final class Hamming {

    public static Integer compute(String strand1, String strand2) {
        Integer sum = 0;

        for (Integer i = 0; i < Math.min(strand1.length(), strand2.length()); i++)
        {
            sum += strand1.charAt(i) == strand2.charAt(i) ? 0 : 1;
        }

        return sum;
    }
}