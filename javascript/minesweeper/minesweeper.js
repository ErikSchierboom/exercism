export default class Minesweeper {
  annotate(board) {
    this.board = board;

    return this.range(this.rows).map(this.annotateRow.bind(this));
  }

  annotateRow(row) {
    return this.range(this.columns)
      .map(column => this.annotatePosition([row, column]))
      .join("");
  }

  annotatePosition(position) {
    if (this.isMine(position)) {
      return "*";
    }

    const numberOfNeighboringMines = this.neighboringMines(position);
    return numberOfNeighboringMines > 0
      ? numberOfNeighboringMines.toString()
      : " ";
  }

  neighboringMines(position) {
    return this.neighboringPositions(position).filter(this.isMine.bind(this))
      .length;
  }

  neighboringPositions(position) {
    const row = position[0];
    const column = position[1];

    const possibleNeighboringPosition = [
      [row - 1, column - 1],
      [row - 1, column],
      [row - 1, column + 1],
      [row, column - 1],
      [row, column + 1],
      [row + 1, column - 1],
      [row + 1, column],
      [row + 1, column + 1]
    ];

    return possibleNeighboringPosition.filter(this.isValidPosition.bind(this));
  }

  isValidPosition(position) {
    const row = position[0];
    const column = position[1];

    return row >= 0 && row < this.rows && column >= 0 && column < this.columns;
  }

  isMine(position) {
    const row = position[0];
    const column = position[1];

    return this.board[row][column] === "*";
  }

  get rows() {
    return this.board.length;
  }

  get columns() {
    return this.board[0].length;
  }

  range(length) {
    return [...Array(length).keys()];
  }
}
