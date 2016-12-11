export default class Binary {
    constructor(binary) {
        this.digits = /^[01]*$/.test(binary) ? [...binary] : [];
    }

    toDecimal() {
        return this.digits.reduce((acc, c) => acc * 2 + this.charToDecimal(c), 0)
    }

    charToDecimal(c) {
        return c - '0';
    }
}