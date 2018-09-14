final class NaturalNumber {

    private final int number;

    public NaturalNumber(int number) {
        this.number = number;
    }

    public Classification getClassification() {
        int sumOfFactors = 0;

        for (int i = 1; i < number; i++)
            if (number % i == 0)
                sumOfFactors += i;

        if (sumOfFactors < number)
            return Classification.DEFICIENT;
        else if (sumOfFactors == number)
            return Classification.PERFECT;
        else
            return Classification.ABUNDANT;
    }
}