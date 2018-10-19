type SaddlePoint = { row: number, column: number }

export default class SaddlePoints {
    public static saddlePoints(matrix: number[][]): SaddlePoint[] {
        const rows = matrix
        const columns = this.transpose(matrix)

        const maxForRows = this.calculateMaxForRows(rows)
        const minForColumns = this.calculateMinForColumns(columns)

        const points = []

        for (let row = 0; row < rows.length; row += 1) {
            for (let column = 0; column < columns.length; column += 1) {
                if (rows[row][column] >= maxForRows[row] && rows[row][column] <= minForColumns[column]) {
                    points.push({ row, column })
                }
            }
        }

        return points
    }

    private static calculateMaxForRows(rows: number[][]): number[] {
        return rows.map((row) => Math.max(...row))
    }

    private static calculateMinForColumns(columns: number[][]): number[] {
        return columns.map((column) => Math.min(...column))
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