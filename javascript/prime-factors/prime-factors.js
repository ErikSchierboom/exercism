export default class PrimeFactors {
    for(number) {
        var factor = 2;
        var factors = [];

        while (number > 1) {
            while (number % factor != 0) {
                factor += factor == 2 ? 1 : 2;
            }

            number /= factor;
            factors.push(factor);
        }

        return factors;
    }
}