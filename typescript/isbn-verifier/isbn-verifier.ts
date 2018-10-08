export default class ISBN {
    private isbn: string

    constructor(isbn: string) {
        this.isbn = isbn
    }

    isValid() {
        const normalizedNumber = this.normalizeNumber(this.isbn)
        return this.isValidNumber(normalizedNumber) && this.checksum(normalizedNumber) % 11 === 0
    }

    private normalizeNumber(isbn: string) {
        return isbn.replace(/-/g, '')
    }

    private isValidNumber(normalizedNumber: string) {
        return /^\d{9}[\dX]$/.test(normalizedNumber)
    }

    private checksum(normalizedNumber: string) {
        let sum = 0

        for (let i = normalizedNumber.length - 1; i >= 0; i -= 1) {
            sum += this.digitToValue(normalizedNumber[i]) * (i + 1)
        }

        return sum
    }

    private digitToValue(digit: string) {
        return digit === 'X' ? 10 : parseInt(digit, 10)
    }
}
