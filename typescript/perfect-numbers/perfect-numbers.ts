export default class PerfectNumbers {
    public static classify(n: number) {
        if (n < 1) {
            throw new Error('Classification is only possible for natural numbers.')
        }

        let sumOfFactors = 0;

        for (let x = 1; x <= n / 2; x += 1) {
            if (n % x === 0) {
                sumOfFactors += x
            }
        }

        if (sumOfFactors === n) {
            return 'perfect'
        }

        return sumOfFactors < n ? 'deficient' : 'abundant'
    }
}