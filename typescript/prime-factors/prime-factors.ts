export default function calculatePrimeFactors(n: number) {
    const factors = []
    let factor = 2

    while (n > 1) {
        while (n % factor !== 0) {
            factor += factor === 2 ? 1 : 2
        }

        n /= factor
        factors.push(factor)
    }

    return factors
}