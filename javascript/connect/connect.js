const ConnectWinner = {
    None: "",
    White: "O",
    Black: "X"
  }
  
  const ConnectCell = {
    Empty: ".",
    White: "O",
    Black: "X"
  }
  
  export default class ConnectBoard {
    constructor(input) {
      this.board = ConnectBoard.parseBoard(input);
    }
  
    static parseBoard(input) {
      return input
        .map(row => row.replace(/\s+/g, ""))
        .map(row => Array.from(row, this.charToCell));
    }
  
    static charToCell(char) {
      switch (char) {
        case "O":
          return ConnectCell.White;
        case "X":
          return ConnectCell.Black;
        default:
          return ConnectCell.Empty;
      }
    }
  
    winner() {
      if (this.whiteWins) return ConnectWinner.White;
  
      if (this.blackWins) return ConnectWinner.Black;
  
      return ConnectWinner.None;
    }
  
    get whiteWins() {
      return this.colorWins(
        ConnectCell.White,
        this.isWhiteStop.bind(this),
        this.whiteStart.bind(this)
      );
    }
  
    get blackWins() {
      return this.colorWins(
        ConnectCell.Black,
        this.isBlackStop.bind(this),
        this.blackStart.bind(this)
      );
    }
  
    colorWins(
      cell,
      stop,
      start
    ) {
      return start().some(coordinate =>
        this.validPath(cell, stop, [], coordinate)
      );
    }
  
    whiteStart() {
      return Array.from({ length: this.cols }, (_, col) => ({
        col,
        row: 0
      })).filter(coord => this.cellAtCoordinateEquals(ConnectCell.White, coord));
    }
  
    blackStart() {
      return Array.from({ length: this.rows }, (_, row) => ({
        col: 0,
        row
      })).filter(coord => this.cellAtCoordinateEquals(ConnectCell.Black, coord));
    }
  
    isWhiteStop(coordinate) {
      return coordinate.row === this.rows - 1;
    }
  
    isBlackStop(coordinate) {
      return coordinate.col === this.cols - 1;
    }
  
    get cols() {
      return this.board[0].length;
    }
  
    get rows() {
      return this.board.length;
    }
  
    validPath(
      cell,
      stop,
      processed,
      coordinate
    ) {
      if (stop(coordinate)) return true;
  
      const next = this.adjacent(cell, coordinate).filter(
        adjacentCoordinate =>
          !processed.some(
            x =>
              x.col === adjacentCoordinate.col && x.row === adjacentCoordinate.row
          )
      );
  
      if (next.length === 0) return false;
  
      return next.some(nextCoord => {
        const updatedProcessed = Array.from(processed);
        updatedProcessed.push(coordinate);
  
        return this.validPath(cell, stop, updatedProcessed, nextCoord);
      });
    }
  
    adjacent(
      cell,
      coordinate
    ) {
      const coords = [
        { col: coordinate.col + 1, row: coordinate.row - 1 },
        { col: coordinate.col, row: coordinate.row - 1 },
        { col: coordinate.col - 1, row: coordinate.row },
        { col: coordinate.col + 1, row: coordinate.row },
        { col: coordinate.col - 1, row: coordinate.row + 1 },
        { col: coordinate.col, row: coordinate.row + 1 }
      ];
  
      return coords.filter(
        coord =>
          this.isValidCoordinate(coord) &&
          this.cellAtCoordinateEquals(cell, coord)
      );
    }
  
    isValidCoordinate(coordinate) {
      return (
        coordinate.row >= 0 &&
        coordinate.row < this.rows &&
        coordinate.col >= 0 &&
        coordinate.col < this.cols
      );
    }
  
    cellAtCoordinateEquals(
      cell,
      coordinate
    ) {
      return this.board[coordinate.row][coordinate.col] === cell;
    }
  }
  