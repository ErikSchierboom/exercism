export default class Queens {
    constructor(positioning) {
        this._white = positioning ? positioning.white : [0,3];
        this._black = positioning ? positioning.black : [7,3];
    }

    get white() {
        return this._white;
    }

    get black() {
        return this._black;
    }

    canAttack() {
        return this._white[0] === this._black[0] ||
               this._white[1] === this._black[1] ||
               Math.abs(this._black[0] - this._white[0]) === Math.abs(this._black[1] - this._white[1]);
    }

    toString() {
        let board = '';

        for (let row = 0; row < 8; row++) {
            let cells = [];

            for (let col = 0; col < 8; col++) {
                if (this.white[0] === row && this.white[1] === col)
                    cells.push('W');
                else if (this.black[0] === row && this.black[1] === col)
                    cells.push('B');
                else
                    cells.push('_');
            }

            board += cells.join(' ') + '\n';
        }

        return board;
    }
}