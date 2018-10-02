export default class SpiralMatrix {
  static ofSize(size) {
    const totalNumbers = size * size;
    const matrix = [];

    for (let i = 0; i < size; i += 1) {
      matrix.push([]);
    }

    let rowOffset = 0;
    let columnOffset = 0;
    let currentNumber = 1;

    while (currentNumber <= totalNumbers) {
      for (let topColumn = columnOffset; topColumn < size - columnOffset; topColumn += 1) {
        matrix[rowOffset][topColumn] = currentNumber;
        currentNumber += 1;
      }

      for (let rightRow = rowOffset + 1; rightRow < size - rowOffset; rightRow += 1) {
        matrix[rightRow][size - columnOffset - 1] = currentNumber;
        currentNumber += 1;
      }

      for (let bottomColumn = size - columnOffset - 2; bottomColumn >= columnOffset; bottomColumn -= 1) {
        matrix[size - rowOffset - 1][bottomColumn] = currentNumber;
        currentNumber += 1;
      }

      for (let leftRow = size - rowOffset - 2; leftRow >= rowOffset + 1; leftRow -= 1) {
        matrix[leftRow][columnOffset] = currentNumber;
        currentNumber += 1;
      }

      rowOffset += 1;
      columnOffset += 1;
    }

    return matrix;
  }
}

