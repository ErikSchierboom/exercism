export default class DiffieHellman {
    private p: number
    private g: number

    public constructor(p: number, g: number) {
        if (this.invalidPrime(p) || this.invalidPrime(g)) {
            throw new Error('Invalid prime')
        }

        this.p = p
        this.g = g
    }

    public getPublicKeyFromPrivateKey(privateKey: number) {
        if (privateKey < 2 || privateKey >= this.p) {
            throw new Error('Invalid private key')
        }

        return this.g ** privateKey % this.p
    }

    public getSharedSecret(privateKey: number, publicKey: number) {
        return publicKey ** privateKey % this.p
    }

    private invalidPrime(p: number) {
        return p < 2 || this.primeFactors(p).length > 1
    }

    private primeFactors(p: number) {
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