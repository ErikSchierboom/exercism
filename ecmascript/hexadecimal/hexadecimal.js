export default class Hexadecimal {
    constructor(hexadecimal) {
        this.digits = /^[\dabcdef]*$/.test(hexadecimal) ? [...hexadecimal] : [];
        this.hexadecimalDigits = [...'0123456789abcdef'];
    }

    toDecimal() {
        return this.digits.reduce((acc, c) => acc * 16 + this.charToDecimal(c), 0)
    }

    charToDecimal(c) {
        return this.hexadecimalDigits.indexOf(c);
    }
}