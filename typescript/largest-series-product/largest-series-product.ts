export default class Series {
    private digits: number[]

    constructor(input: string) {
        if (!/^\d*$/.test(input)) {
            throw new Error('Invalid input.')
        }

        this.digits = Array.from(input, Number)
    }

    public largestProduct(max: number) {
        if (max < 0) {
            throw new Error('Invalid input.')
        } else if (max > this.digits.length) {
            throw new Error('Slice size is too big.')
        }

        const products = Array.from(this.slices(max)).map(this.product)
        return Math.max(...products)
    }

    private product(slice: number[]) {
        return slice.reduce((x, y) => x * y, 1)
    }

    private *slices(size: number) {
        for (let i = 0; i <= this.digits.length - size; i++) {
            yield this.digits.slice(i, i + size)
        }
    }
}