enum ConnectWinner {
  White = "O",
  Black = "X",
  None = ""
}

enum ConnectCell {
  Empty,
  White,
  Black
}

export interface ConnectCoordinate {
  col: number;
  row: number;
}

export default class ConnectBoard {
  private board: ConnectCell[][];

  constructor(input: string[]) {
    this.board = ConnectBoard.parseBoard(input);
  }

  private static parseBoard(input: string[]): ConnectCell[][] {
    return input
      .map(row => row.replace(/\s+/g, ""))
      .map(row => Array.from(row, this.charToCell));
  }

  private static charToCell(char: string): ConnectCell {
    switch (char) {
      case "O":
        return ConnectCell.White;
      case "X":
        return ConnectCell.Black;
      default:
        return ConnectCell.Empty;
    }
  }

  public winner(): ConnectWinner {
    if (this.whiteWins) return ConnectWinner.White;

    if (this.blackWins) return ConnectWinner.Black;

    return ConnectWinner.None;
  }

  private get whiteWins(): boolean {
    return this.colorWins(
      ConnectCell.White,
      this.isWhiteStop.bind(this),
      this.whiteStart.bind(this)
    );
  }

  private get blackWins(): boolean {
    return this.colorWins(
      ConnectCell.Black,
      this.isBlackStop.bind(this),
      this.blackStart.bind(this)
    );
  }

  private colorWins(
    cell: ConnectCell,
    stop: (coordinate: ConnectCoordinate) => boolean,
    start: () => ConnectCoordinate[]
  ): boolean {
    return start().some(coordinate =>
      this.validPath(cell, stop, [], coordinate)
    );
  }

  private whiteStart(): ConnectCoordinate[] {
    return Array.from({ length: this.cols }, (_, col) => ({
      col,
      row: 0
    })).filter(coord => this.cellAtCoordinateEquals(ConnectCell.White, coord));
  }

  private blackStart(): ConnectCoordinate[] {
    return Array.from({ length: this.rows }, (_, row) => ({
      col: 0,
      row
    })).filter(coord => this.cellAtCoordinateEquals(ConnectCell.Black, coord));
  }

  private isWhiteStop(coordinate: ConnectCoordinate): boolean {
    return coordinate.row === this.rows - 1;
  }

  private isBlackStop(coordinate: ConnectCoordinate): boolean {
    return coordinate.col === this.cols - 1;
  }

  private get cols() {
    return this.board[0].length;
  }

  private get rows() {
    return this.board.length;
  }

  private validPath(
    cell: ConnectCell,
    stop: (coordinate: ConnectCoordinate) => boolean,
    processed: ConnectCoordinate[],
    coordinate: ConnectCoordinate
  ): boolean {
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

  private adjacent(
    cell: ConnectCell,
    coordinate: ConnectCoordinate
  ): ConnectCoordinate[] {
    const coords: ConnectCoordinate[] = [
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

  private isValidCoordinate(coordinate: ConnectCoordinate): boolean {
    return (
      coordinate.row >= 0 &&
      coordinate.row < this.rows &&
      coordinate.col >= 0 &&
      coordinate.col < this.cols
    );
  }

  private cellAtCoordinateEquals(
    cell: ConnectCell,
    coordinate: ConnectCoordinate
  ): boolean {
    return this.board[coordinate.row][coordinate.col] === cell;
  }
}
