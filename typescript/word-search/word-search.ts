type Direction = [number, number];
type Position = [number, number];

interface Match {
  start: Position;
  end: Position;
}

type Result = Match | undefined;

interface Results {
  [word: string]: Result;
}

const directions: Direction[] = [
  [1, 0],
  [0, 1],
  [-1, 0],
  [0, -1],
  [1, 1],
  [1, -1],
  [-1, 1],
  [-1, -1],
];

export default class WordSearch {
  private grid: string[];
  private width: number;
  private height: number;

  constructor(grid: string[]) {
    this.grid = grid;
    this.width = grid[0].length;
    this.height = grid.length;
  }

  public find(words: string[]): Results {
    const results: Results = {};

    for (const word of words) {
      results[word] = this.findWord(word);
    }

    return results;
  }

  private findWord(word: string): Result {
    for (const position of this.allPositions()) {
      for (const direction of directions) {
        const wordPosition = this.findWordPosition(word, position, direction);
        if (wordPosition !== undefined) {
          return wordPosition;
        }
      }
    }

    return undefined;
  }

  private findWordPosition(
    word: string,
    startPosition: Position,
    direction: Direction
  ): Result {
    const [offsetY, offsetX] = direction;
    let [currentY, currentX] = startPosition;

    for (const letter of [...word]) {
      if (this.getLetter([currentY, currentX]) !== letter) {
        return undefined;
      }

      currentX += offsetX;
      currentY += offsetY;
    }

    return {
      start: startPosition,
      end: [currentY - offsetY, currentX - offsetX],
    };
  }

  private allPositions(): Position[] {
    const results: Position[] = [];

    for (let x = 1; x <= this.width; x++) {
      for (let y = 1; y <= this.height; y++) {
        results.push([y, x]);
      }
    }

    return results;
  }

  private getLetter(position: Position): string | undefined {
    const [y, x] = position;

    if (y < 1 || y > this.height || x < 1 || x > this.width) {
      return undefined;
    }

    return this.grid[y - 1][x - 1];
  }
}
