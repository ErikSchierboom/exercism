import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

public class Luhn {

    private final int[] addends;

    public Luhn(long number) {
        addends = calculateAddends(number);
    }

    public int getCheckDigit() {
        return this.addends[this.addends.length - 1];
    }

    public int[] getAddends() {
        return this.addends;
    }

    public int getCheckSum() {
        return Arrays.stream(this.getAddends())
                .sum();
    }

    public boolean isValid() {
        return this.getCheckSum() % 10 == 0;
    }

    public static long create(int number) {
        long targetNumber = number * 10L;

        Luhn luhn = new Luhn(targetNumber);

        if (!luhn.isValid()) {
            targetNumber += 10 - (luhn.getCheckSum() % 10);
        }

        return targetNumber;
    }

    private static int[] calculateAddends(long number) {
        List<Integer> digits = getDigits(number);
        int[] addends = new int[digits.size()];

        for (int i = 0; i < digits.size(); i++) {
            int index = digits.size() - i - 1;
            addends[index] = getDigitValue(digits.get(index), i);
        }

        return addends;
    }

    private static List<Integer> getDigits(long number) {
        List<Integer> digits = new LinkedList<>();

        for (Character c: Long.toString(number).toCharArray()) {
            digits.add(Integer.parseInt(c.toString()));
        }

        return digits;
    }

    private static int getDigitValue(int digit, int index) {
        if (index % 2 == 0) {
            return digit;
        }

        int doubledValue = digit * 2;
        return doubledValue > 9 ? doubledValue - 9 : doubledValue;
    }
}
