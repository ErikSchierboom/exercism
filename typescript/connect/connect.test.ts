import { Board } from "./connect";

describe("Judging a game of connect", () => {
  it("an empty board has no winner", () => {
    const board = [
      ". . . . .",
      " . . . . .",
      "  . . . . .",
      "   . . . . .",
      "    . . . . .",
    ];
    expect(new Board(board).winner()).toEqual("");
  });

  it("X can win on a 1x1 board", () => {
    const board = ["X"];
    expect(new Board(board).winner()).toEqual("X");
  });

  it("O can win on a 1x1 board", () => {
    const board = ["O"];
    expect(new Board(board).winner()).toEqual("O");
  });

  it("only edges does not make a winner", () => {
    const board = ["O O O X", " X . . X", "  X . . X", "   X O O O"];
    expect(new Board(board).winner()).toEqual("");
  });

  it("illegal diagonal does not make a winner", () => {
    const board = [
      "X O . .",
      " O X X X",
      "  O X O .",
      "   . O X .",
      "    X X O O",
    ];
    expect(new Board(board).winner()).toEqual("");
  });

  it("nobody wins crossing adjacent angles", () => {
    const board = [
      "X . . .",
      " . X O .",
      "  O . X O",
      "   . O . X",
      "    . . O .",
    ];
    expect(new Board(board).winner()).toEqual("");
  });

  it("X wins crossing from left to right", () => {
    const board = [
      ". O . .",
      " O X X X",
      "  O X O .",
      "   X X O X",
      "    . O X .",
    ];
    expect(new Board(board).winner()).toEqual("X");
  });

  it("O wins crossing from top to bottom", () => {
    const board = [
      ". O . .",
      " O X X X",
      "  O O O .",
      "   X X O X",
      "    . O X .",
    ];
    expect(new Board(board).winner()).toEqual("O");
  });

  it("X wins using a convoluted path", () => {
    const board = [
      ". X X . .",
      " X . X . X",
      "  . X . X .",
      "   . X X . .",
      "    O O O O O",
    ];
    expect(new Board(board).winner()).toEqual("X");
  });

  it("X wins using a spiral path", () => {
    const board = [
      "O X X X X X X X X",
      " O X O O O O O O O",
      "  O X O X X X X X O",
      "   O X O X O O O X O",
      "    O X O X X X O X O",
      "     O X O O O X O X O",
      "      O X X X X X O X O",
      "       O O O O O O O X O",
      "        X X X X X X X X O",
    ];
    expect(new Board(board).winner()).toEqual("X");
  });
});
