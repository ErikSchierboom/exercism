export default class Octal {
    constructor(octal) {
        this.digits = /^[01234567]*$/.test(octal) ? [...octal] : [];
    }

    toDecimal() {
        return this.digits.reduce((acc, c) => acc * 8 + this.charToDecimal(c), 0)
    }

    charToDecimal(c) {
        return c - '0';
    }
}