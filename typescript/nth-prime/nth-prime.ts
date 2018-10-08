function* possiblePrimes() {
    let n = 6

    for (; ;) {
        yield n - 1
        yield n + 1

        n += 6
    }
}

function* primes() {
    yield 2
    yield 3

    for (const prime of possiblePrimes()) {
        if (isPrime(prime)) {
            yield prime
        }
    }
}

function isPrime(n: number) {
    const r = Math.floor(Math.sqrt(n))

    if (r < 5) {
        return true
    }

    for (let i = 5; i < r + 1; i += 1) {
        if (n % i === 0) {
            return false
        }
    }

    return true
}

export default class Prime {
    public nth(n: number) {
        if (n < 1) {
            throw new Error('Prime is not possible')
        }

        let prime = 0
        const p = primes()

        for (let i = 0; i < n; i += 1) {
            prime = p.next().value
        }

        return prime
    }
}