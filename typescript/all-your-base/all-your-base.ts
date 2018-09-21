export default class Converter {
    convert(digits: number[], inBase: number, outBase: number) {
        if (this.inValidBase(inBase)) {
            throw 'Wrong input base'
        }

        if (this.inValidBase(outBase)) {
            throw 'Wrong output base'
        }

        if (this.invalidDigits(digits, inBase)) {
            throw 'Input has wrong format'
        }

        return this.toOutBaseDigits(this.toInBaseInt(digits, inBase), outBase)
    }

    private inValidBase(base: number) {
        return base < 2 || base % 1 !== 0
    }

    private invalidDigits(digits: number[], inBase: number) {
        return digits.length === 0 || (digits.length > 1 && digits[0] === 0) || digits.some((digit) => digit < 0 || digit >= inBase)
    }

    private toInBaseInt(digits: number[], inBase: number) {
        return digits.reduce((acc, digit) => acc * inBase + digit, 0)
    }

    private toOutBaseDigits(n: number, outBase: number) {
        const digits: number[] = []
        let quotient: number
        let remainder: number

        do {
            quotient = Math.floor(n / outBase)
            remainder = n % outBase

            digits.push(remainder)
            n = quotient
        } while (quotient > 0)

        return digits.reverse()
    }
}