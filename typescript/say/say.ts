export default class Say {
    public inEnglish(value: number) {
        if (value < 0 || value > 999999999999) {
            throw new Error('Number must be between 0 and 999,999,999,999.')
        }

        if (value === 0) {
            return 'zero'
        }

        return this.parts(value).join(' ')
    }

    private parts(value: number) {
        const [billionsCount, millionsCount, thousandsCount, remainder] = this.counts(value)

        return [
            this.billions(billionsCount),
            this.millions(millionsCount),
            this.thousands(thousandsCount),
            this.hundreds(remainder)].filter((x) => x !== undefined)
    }

    private bases(value: number): string | undefined {
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
        ]

        return value > 0 && value <= values.length ? values[value - 1] : undefined
    }

    private tens(value: number): string | undefined {
        if (value < 20) {
            return this.bases(value)
        }

        const values = [
            "twenty",
            "thirty",
            "forty",
            "fifty",
            "sixty",
            "seventy",
            "eighty",
            "ninety"
        ]

        const count = Math.floor(value / 10)
        const remainder = value % 10
        const bases = this.bases(remainder)

        const countStr = values[count - 2]
        const basesStr = bases === undefined ? "" : `-${bases}`

        return `${countStr}${basesStr}`
    }

    private hundreds(value: number): string | undefined {
        if (value < 100) {
            return this.tens(value)
        }

        const count = Math.floor(value / 100)
        const remainder = value % 100
        const bases = this.bases(count)
        const tens = this.tens(remainder)
        const tensStr = tens === undefined ? "" : ` ${tens}`

        return `${bases} hundred${tensStr}`
    }

    private chunk(str: string, value: number): string | undefined {
        const hundreds = this.hundreds(value)
        return hundreds === undefined ? undefined : `${hundreds} ${str}`
    }

    private thousands(value: number) {
        return this.chunk("thousand", value)
    }

    private millions(value: number) {
        return this.chunk("million", value)
    }

    private billions(value: number) {
        return this.chunk("billion", value)
    }

    private counts(value: number): number[] {
        const billionsCount = Math.floor(value / 1000000000)
        const billionsRemainder = value % 1000000000

        const millionsCount = Math.floor(billionsRemainder / 1000000)
        const millionsRemainder = billionsRemainder % 1000000

        const thousandsCount = Math.floor(millionsRemainder / 1000)
        const thousandsRemainder = millionsRemainder % 1000

        return [billionsCount, millionsCount, thousandsCount, thousandsRemainder]
    }
}