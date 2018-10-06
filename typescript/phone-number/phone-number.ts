export default class PhoneNumber {
    private validatedNumber: string | undefined

    constructor(input: string) {
        const digits = this.parseDigits(input)
        this.validatedNumber = digits.length === 10 ? digits.join('') : undefined
    }

    public number(): string | undefined {
        return this.validatedNumber
    }

    private hasInvalidCharacter(input: string): boolean {
        return /[^\d\. \(\)-]+/.test(input)
    }

    private parseDigits(input: string): string[] {
        if (this.hasInvalidCharacter(input)) {
            return []
        }

        const digits = input.match(/\d/g)
        if (digits === null) {
            return []
        }

        if (digits.length === 11 && digits[0] === '1') {
            return digits.slice(1)
        }

        return digits
    }
}