export default class ISBN {
    constructor(number) {
        this.number = number;
    }

    isValid() {
        const normalizedNumber = this.normalizeNumber(this.number);
        return this.isValidNumber(normalizedNumber) && this.checksum(normalizedNumber) % 11 == 0;
    }

    normalizeNumber(number) {
        return number.replace(/-/g, '')
    }

    isValidNumber(normalizedNumber) {
        return /^\d{9}[\dX]$/.test(normalizedNumber);
    }

    checksum(normalizedNumber)  {
        let sum = 0;

        for (let i = normalizedNumber.length - 1; i >=0; i--) {
            sum += this.digitToValue(normalizedNumber[i]) * (i + 1);
        }

        return sum;
    }

    digitToValue(digit) {
        return digit == 'X' ? 10 : parseInt(digit);
    }
}
