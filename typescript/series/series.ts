export default class Series {
    public digits: number[]

    constructor(input: string) {
        this.digits = Array.from(input, Number)
    }

    slices(size: number) {
        if (size > this.digits.length) {
            throw new Error('Slice size is too big.')
        }

        const result = []

        for (let i = 0; i <= this.digits.length - size; i++) {
            result.push(this.digits.slice(i, i + size))
        }

        return result
    }
}