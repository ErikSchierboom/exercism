export default class Matrix {
    constructor(input) {
        this._rows = Matrix.parseRows(input);
        this._columns = Matrix.transpose(this.rows);
    }

    get rows() {
        return this._rows;
    }

    get columns() {
        return this._columns
    }

    static parseRows(input) {
        return input.split('\n').map(Matrix.parseRow);
    }

    static parseRow(row) {
        return row.trim().split(' ').map(char => parseInt(char.toString()));
    }

    static transpose(input) {
        const transposed = [];

        for (let i = 0; i < input.length; i++) {
            for (let j = 0; j < input[i].length; j++) {
                if (transposed.length <= j)
                    transposed[j] = [];

                transposed[j].push(input[i][j]);
            }
        }

        return transposed
    }
}