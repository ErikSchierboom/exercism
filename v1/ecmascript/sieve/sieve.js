function* range(begin, end) {
    for (let i = begin; i <= end; i++) {
        yield i;
    }
}

export default class Sieve {
    constructor(max) {
        this.max = max;
    }

    get primes() {
        let possiblePrimes = [...range(2, this.max)];
        const primes = [];

        while (possiblePrimes.length > 0) {
            const prime = possiblePrimes[0];
            primes.push(prime);

            possiblePrimes = this.excludePrimeMultiples(possiblePrimes, prime);
        }

        return primes;
    }

    excludePrimeMultiples(possiblePrimes, prime) {
        return possiblePrimes.filter(n => n % prime !== 0);
    }
}