export default class ArmstrongNumbers {
    static isArmstrongNumber(n: number) {
        const digits = ArmstrongNumbers.parseDigits(n)
        return ArmstrongNumbers.digitsToPower(digits, digits.length) === n
    }

    static parseDigits(n: number) {
        return Array.from(n.toString(), Number)
    }

    static digitsToPower(digits: number[], exponent: number) {
        return digits.reduce((acc, digit) => acc + digit ** exponent, 0)
    }
}