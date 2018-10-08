export default class Luhn {
    public static valid(input: string) {
        const addends = this.getAddends(input.replace(/ /g, ''))
        return addends.length > 1 && this.calculateChecksum(addends) % 10 === 0
    }

    private static getAddends(input: string) {
        const addends = []
        let digits = Array.from(input, Number)

        for (let i = 0; i < digits.length; i++)
            addends.push(this.getDigitValue(digits[digits.length - i - 1], i))

        return addends.reverse()
    }

    private static getDigitValue(digit: number, index: number) {
        if (index % 2 === 0) {
            return digit
        }

        const doubledValue = digit * 2
        return doubledValue > 9 ? doubledValue - 9 : doubledValue
    }

    private static calculateChecksum(addends: number[]) {
        return addends.reduce((x, y) => x + y, 0)
    }
}