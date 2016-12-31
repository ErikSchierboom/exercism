export default class Converter {
    convert(inputDigits, inputBase, outputBase) {
        if (this.invalidBase(inputBase)) {
            throw new Error('Wrong input base');
        }
        if (this.invalidBase(outputBase)) {
            throw new Error('Wrong output base');
        }
        if (this.invalidInputDigits(inputDigits, inputBase)) {
            throw new Error('Input has wrong format');
        }

        return this.toDigits(outputBase, this.fromDigits(inputBase, inputDigits));
    }

    invalidBase(base) {
        return base < 2 || !this.isInt(base);
    }

    isInt(number) {
        return number % 1 === 0;
    }

    invalidInputDigits(inputDigits, inputBase) {
        if (inputDigits.length === 0) {
            return true;
        }

        if (inputDigits.length === 1) {
            return inputDigits[0] < 0;
        }

        if (inputDigits[0] === 0) {
            return true;
        }

        return inputDigits.findIndex(digit => digit < 0 || digit >= inputBase) !== -1;
    }

    fromDigits(inputBase, inputDigitis) {
        let result = 0;

        for (const fromDigit of inputDigitis) {
            result = result * inputBase + fromDigit;
        }

        return result;
    }

    toDigits(outputBase, decimal) {
        if (decimal === 0) {
            return [0];
        }

        const digits = [];
        let remainder = decimal;
        let multiplier = 1;

        while (remainder > 0) {
            multiplier *= outputBase;

            const value = remainder % multiplier;
            const digit = value / (multiplier / outputBase);

            digits.push(digit);
            remainder -= value;
        }

        return digits.reverse();
    }
}