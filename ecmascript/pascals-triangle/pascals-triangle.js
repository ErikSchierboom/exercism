export default class Triangle {
    constructor(size) {
        this.size = size;
    }

    get rows() {
        let acc = [];

        for (let i = 1; i <= this.size; i++)
            acc.push(this.row(i));

        return acc;
    }

    get lastRow() {
        return this.row(this.size);
    }

    row(n) {
        let digits = [1];
        let column = 1;

        for (let j = 1; j < n; j++) {
            column = column * (n - j) / j;
            digits.push(column);
        }

        return digits;
    }
}