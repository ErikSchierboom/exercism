export default class Say {
    inEnglish(number) {
        if (number < 0 || number > 999999999999) 
            throw new Error('Number must be between 0 and 999,999,999,999.');

        if (number === 0)
            return 'zero';

        return this.parts(number).join(' ');
    }

    parts(number) {
        const [billionsCount, millionsCount, thousandsCount, remainder] = this.counts(number);
        
        return [this.billions(billionsCount), 
                this.millions(millionsCount),
                this.thousands(thousandsCount),
                this.hundreds(remainder)]
                .filter(x => x !== null);
    }

    bases(number) {
        const values = [
            "one",
            "two",
            "three",
            "four",
            "five",
            "six",
            "seven",
            "eight",
            "nine",
            "ten",
            "eleven",
            "twelve",
            "thirteen",
            "fourteen",
            "fifteen",
            "sixteen",
            "seventeen",
            "eighteen",
            "nineteen"
        ];

        return number > 0 && number <= values.length ? values[number - 1] : null;
    }

    tens(number) {
        if (number < 20)
            return this.bases(number);

        const values = [
            "twenty",
            "thirty",
            "forty",
            "fifty",
            "sixty",
            "seventy",
            "eighty",
            "ninety"
        ];

        const count = Math.floor(number / 10);
        const remainder = number % 10;
        const bases = this.bases(remainder);

        const countStr = values[count - 2];
        const basesStr = bases == null ? "" : `-${bases}`;

        return `${countStr}${basesStr}`;
    }

    hundreds(number){
        if (number < 100)
            return this.tens(number);
        
        const count = Math.floor(number / 100);
        const remainder = number % 100;
        const bases = this.bases(count);
        const tens = this.tens(remainder);
        const tensStr = tens == null ? "" : ` ${tens}`;
        
        return `${bases} hundred${tensStr}`;
    }

    chunk(str, number) {
        const hundreds = this.hundreds(number);
        return hundreds == null ? null : `${hundreds} ${str}`;
    }

    thousands(number) {
        return this.chunk("thousand", number);
    }

    millions(number) {
        return this.chunk("million", number);
    }

    billions(number) {
        return this.chunk("billion", number);
    }

    counts(number) {
        const billionsCount = Math.floor(number / 1000000000);
        const billionsRemainder = number % 1000000000;

        const millionsCount = Math.floor(billionsRemainder / 1000000);
        const millionsRemainder = billionsRemainder % 1000000;

        const thousandsCount = Math.floor(millionsRemainder / 1000);
        const thousandsRemainder = millionsRemainder % 1000;

        return [billionsCount, millionsCount, thousandsCount, thousandsRemainder];
    }
}