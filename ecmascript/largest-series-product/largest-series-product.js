export default class Series {
    constructor(input) {
        if (!/^\d*$/.test(input))
            throw new Error('Invalid input.');

        this.digits = [...input].map(char => char - '0');
    }

    largestProduct(max) {
        if (max < 0)
            throw new Error('Invalid input.');
        if (max > this.digits.length)
            throw new Error('Slice size is too big.');

        return [...this.slices(max)]
            .map(slice => this.product(slice))
            .reduce((x, y) => Math.max(x, y), 0)
    }

    product(slice) {
        return slice.reduce((x, y) => x * y, 1);
    }

    *slices(size) {
        for (let i = 0; i <= this.digits.length - size; i++) {
            yield this.digits.slice(i, i + size);
        }
    }
}