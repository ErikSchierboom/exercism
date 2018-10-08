export default class Matrix {
    private readonly _rows: number[][]
    private readonly _columns: number[][]

    constructor(input: string) {
        this._rows = Matrix.parseRows(input)
        this._columns = Matrix.transpose(this.rows)
    }

    get rows(): number[][] {
        return this._rows
    }

    get columns(): number[][] {
        return this._columns
    }

    static parseRows(input: string): number[][] {
        return input.split('\n').map(Matrix.parseRow)
    }

    static parseRow(row: string): number[] {
        return Array.from(row.trim().split(' '), Number)
    }

    static transpose(input: number[][]): number[][] {
        const transposed: number[][] = []

        for (let i = 0; i < input.length; i += 1) {
            for (let j = 0; j < input[i].length; j += 1) {
                if (transposed.length <= j) {
                    transposed[j] = []
                }

                transposed[j].push(input[i][j])
            }
        }

        return transposed
    }
}