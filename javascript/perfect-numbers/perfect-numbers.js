export default class PerfectNumbers {
    classify(number) {
        if (number < 1) {
            throw new Error('Classification is only possible for natural numbers.');
        }

        let sumOfFactors = 0;

        for (let x = 1; x <= number / 2; x += 1) {
            if (number % x === 0) {
                sumOfFactors += x;
            }
        }

        if (sumOfFactors === number) { 
            return 'perfect';
        }

        return sumOfFactors < number ? 'deficient' : 'abundant';
    }
}