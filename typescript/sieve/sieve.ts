function* range(begin: number, end: number) {
    for (let i = begin; i <= end; i += 1) {
        yield i
    }
}

export default class Sieve {
    static primes(max: number): number[] {
        let possiblePrimes = [...range(2, max)]
        const primes = []

        while (possiblePrimes.length > 0) {
            const prime = possiblePrimes[0]
            primes.push(prime)

            possiblePrimes = this.excludePrimeMultiples(possiblePrimes, prime)
        }

        return primes
    }

    private static excludePrimeMultiples(possiblePrimes: number[], prime: number) {
        return possiblePrimes.filter((n) => n % prime !== 0)
    }
}