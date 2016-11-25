export default class PhoneNumber {
    constructor(input) {
        this.validatedNumber = input.replace(/(\D)/g, '');

        if (this.validatedNumber.length === 11 && this.validatedNumber[0] === '1') {
            this.validatedNumber = this.validatedNumber.substr(1);
        }

        if (this.validatedNumber.length !== 10) {
            this.validatedNumber = '0000000000';
        }
    }

    number() {
        return this.validatedNumber;
    }

    areaCode() {
        return this.validatedNumber.substr(0, 3);
    }

    toString() {
        return `(${this.areaCode()}) ${this.validatedNumber.substr(3, 3)}-${this.validatedNumber.substr(6, 4)}`;
    }
}