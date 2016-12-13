export default class Matrix {
    constructor(input) {
        this._rows = Matrix.parseRows(input);
        this._columns = Matrix.transpose(this._rows);
    }

    get rows() {
        return this._rows;
    }

    get columns() {
        return this._columns;
    }

    get saddlePoints() {
        this.calculateMaxForRows();
        this.calculateMaxForColumns();

        let points = [];

        for (let row = 0; row < this.rows.length; row++) {
            for (let col = 0; col < this.columns.length; col++) {
                if (this.rows[row][col] >= this.maxRow[row] && 
                    this.rows[row][col] <= this.minCol[col])
                    points.push([row, col]);
            }    
        }

        return points;
    }

    calculateMaxForRows() {
        this.maxRow = [];

        for (let row = 0; row < this.rows.length; row++)
            this.maxRow[row] = Math.max(...this.rows[row]);
    }

    calculateMaxForColumns() {
        this.minCol = [];

        for (let col = 0; col < this.columns.length; col++)
            this.minCol[col] = Math.min(...this.columns[col]);
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