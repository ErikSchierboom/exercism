export default class Luhn {
    constructor(number) {
        this._addends = this.getAddends(number);
    }

    get checkDigit() {
        return this.addends[this.addends.length - 1];
    }

    get checksum() {
        return this.addends.reduce((x, y) => x + y, 0);
    }

    get addends() {
        return this._addends;
    }

    get valid() {
        return this.checksum % 10 === 0;
    }

    static create(number) {
        let targetNumber = number * 10;

        const luhn = new Luhn(targetNumber);

        if (!luhn.valid)
            targetNumber += 10 - luhn.checksum % 10;

        return targetNumber;
    }

    getAddends(number) {
        let addends = [];
        let digits = [...number.toString()].map(c => c - '0');

        for (let i = 0; i < digits.length; i++)
            addends.push(this.getDigitValue(digits[digits.length - i - 1], i))
        
        return addends.reverse(); 
    }

    getDigitValue(digit, index) {
        if (index % 2 == 0)
            return digit;

        const doubledValue = digit * 2;
        return doubledValue > 9 ? doubledValue - 9 : doubledValue;
    }
}