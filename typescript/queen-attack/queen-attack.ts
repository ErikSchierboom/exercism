type Queen = [number, number]

export default class QueenAttack {
    public white: Queen
    public black: Queen

    constructor(position: { black: Queen, white: Queen }) {
        if (position.black[0] === position.white[0] &&
            position.black[1] === position.white[1]) {
            throw "Queens cannot share the same space"
        }

        this.black = position.black
        this.white = position.white
    }

    canAttack() {
        return this.black[0] === this.white[0] ||
               this.black[1] === this.white[1] ||
               Math.abs(this.black[0] - this.white[0]) === Math.abs(this.black[1] - this.white[1])
    }

    toString() {
        let board = ''

        for (let row = 0; row < 8; row++) {
            const boardCells: string[] = []

            for (let col = 0; col < 8; col++) {
                if (this.black[0] === row && this.black[1] === col) {
                    boardCells.push('B')
                } else if (this.white[0] === row && this.white[1] === col) {
                    boardCells.push('W')
                } else {
                    boardCells.push('_')
                }
            }

            board += boardCells.join(' ') + '\n'
        }

        return board
    }
}