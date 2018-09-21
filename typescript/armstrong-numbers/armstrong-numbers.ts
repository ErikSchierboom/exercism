export default class ArmstrongNumbers {
    static isArmstrongNumber(n: number) {
        const digits = ArmstrongNumbers.parseDigits(n)
        return ArmstrongNumbers.digitsToPower(digits, digits.length) === n
    }

    static parseDigits(n: number) {
        return n.toString().split('').map(Number)
    }

    static digitsToPower(digits: number[], exponent: number) {
        return digits.reduce((acc, digit) => acc + Math.pow(digit, exponent), 0)
    }
}