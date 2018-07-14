import java.util.LinkedList;
import java.util.List;

public class PrimeFactors {
    public static List<Long> getForNumber(long input) {
        List<Long> factors = new LinkedList<Long>();

        Long number = input;
        Long factor = 2L;

        while (number > 1)
        {
            while (number % factor != 0)
            {
                factor += factor == 2 ? 1 : 2;
            }

            number /= factor;

            factors.add(factor);
        }

        return factors;
    }
}
