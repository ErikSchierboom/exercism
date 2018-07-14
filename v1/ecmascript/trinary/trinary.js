export default class Trinary {
    constructor(trinary) {
        this.digits = /^[012]*$/.test(trinary) ? [...trinary] : [];
    }

    toDecimal() {
        return this.digits.reduce((acc, c) => acc * 3 + this.charToDecimal(c), 0)
    }

    charToDecimal(c) {
        return c - '0';
    }
}