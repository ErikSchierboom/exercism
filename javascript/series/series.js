export default class Series {
    constructor(input) {
        this._digits = [...input].map(x => x - '0');
    }

    get digits() {
        return this._digits;
    }

    slices(size) {
        if (size > this.digits.length)
            throw new Error('Slice size is too big.');

        const result = []

        for (let i = 0; i <= this.digits.length - size; i++) {
            result.push(this.digits.slice(i, i + size));
        }

        return result;
    }
}