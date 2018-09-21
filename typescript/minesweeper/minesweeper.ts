type Position = [number, number]

export default class Minesweeper {
    private board: string[]

    annotate(board: string[]) {
        this.board = board

        return this.range(this.rows).map(this.annotateRow.bind(this))
    }

    private annotateRow(row: number) {
        return this.range(this.columns).map((column) => this.annotatePosition([row, column])).join('')
    }

    private annotatePosition(position: Position) {
        if (this.isMine(position)) {
            return '*'
        }

        const numberOfNeighboringMines = this.neighboringMines(position)
        return numberOfNeighboringMines > 0 ? numberOfNeighboringMines.toString() : ' '
    }

    private neighboringMines(position: Position) {
        return this.neighboringPositions(position).filter(this.isMine.bind(this)).length
    }

    private neighboringPositions(position: Position) {
        const row = position[0]
        const column = position[1]

        const possibleNeighboringPosition = [
            [row - 1, column - 1],
            [row - 1, column    ],
            [row - 1, column + 1],
            [row,     column - 1],
            [row,     column + 1],
            [row + 1, column - 1],
            [row + 1, column    ],
            [row + 1, column + 1]
        ] as Position[]

        return possibleNeighboringPosition.filter(this.isValidPosition.bind(this))
    }

    private isValidPosition(position: Position) {
        const row = position[0]
        const column = position[1]

        return row >= 0 && row < this.rows && column >= 0 && column < this.columns
    }

    private isMine(position: Position) {
        const row = position[0]
        const column = position[1]

        return this.board[row][column] === '*'
    }

    private get rows() {
        return this.board.length
    }

    private get columns() {
        return this.board[0].length
    }

    private range(length: number) {
        return [...Array(length).keys()]
    }
}