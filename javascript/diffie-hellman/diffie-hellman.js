export default class DiffieHellman {
    constructor(p, g) {
        if (this.invalidPrime(p) || this.invalidPrime(g)) {
            throw new Error('Invalid prime')
        }

        this.p = p
        this.g = g
    }

    getPublicKeyFromPrivateKey(privateKey) {
        if (privateKey < 2 || privateKey >= this.p) {
            throw new Error('Invalid key')
        }

        return this.g ** privateKey % this.p
    }

    getSharedSecret(privateKey, publicKey) {
        return publicKey ** privateKey % this.p
    }

    invalidPrime(p) {
        return p < 2 || this.primeFactors(p).length > 1
    }

    primeFactors(p) {
        const factors = []
        let factor = 2

        while (p > 1) {
            while (p % factor !== 0) {
                factor += factor === 2 ? 1 : 2
            }

            p /= factor

            factors.push(factor)
        }

        return factors
    }
}