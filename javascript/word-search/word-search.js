const directions = [
  [1, 0],
  [0, 1],
  [-1, 0],
  [0, -1],
  [1, 1],
  [1, -1],
  [-1, 1],
  [-1, -1]
];

export default class WordSearch {
  constructor(grid) {
    this.grid = grid;
    this.width = this.grid[0].length;
    this.height = this.grid.length;
  }

  find(words) {
    const results = {};

    for (const word of words) {
      results[word] = this.findWord(word);
    }

    return results;
  }

  findWord(word) {
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

  findWordPosition(word, startPosition, direction) {
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
      end: [currentY - offsetY, currentX - offsetX]
    };
  }

  allPositions() {
    const results = [];

    for (let x = 1; x <= this.width; x++) {
      for (let y = 1; y <= this.height; y++) {
        results.push([y, x]);
      }
    }

    return results;
  }

  getLetter(position) {
    const [y, x] = position;

    if (y < 1 || y > this.height || x < 1 || x > this.width) {
      return undefined;
    }

    return this.grid[y - 1][x - 1];
  }
}
