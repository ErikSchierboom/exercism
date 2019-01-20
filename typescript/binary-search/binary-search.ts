function isSorted(array: number[]) {
  for (let i = 0; i < array.length - 2; i++) {
    if (array[i] > array[i + 1]) return false;
  }

  return true;
}

export default class BinarySearch {
  private input: number[];
  private sorted: boolean;

  constructor(input: number[]) {
    this.input = input;
    this.sorted = isSorted(input);
  }

  get array(): number[] | undefined {
    return this.sorted ? this.input : undefined;
  }

  public indexOf(value: number): number {
    if (this.input.length === 0) return -1;

    return this.indexOfRange(value, 0, this.input.length - 1);
  }

  private indexOfRange(
    value: number,
    minIndex: number,
    maxIndex: number
  ): number {
    var middleIndex = Math.round((minIndex + maxIndex) / 2);

    if (this.input[middleIndex] == value) return middleIndex;

    if (
      middleIndex <= 0 ||
      middleIndex >= this.input.length - 1 ||
      middleIndex < minIndex
    )
      return -1;

    if (this.input[middleIndex] > value)
      return this.indexOfRange(value, minIndex, middleIndex - 1);

    return this.indexOfRange(value, middleIndex + 1, maxIndex);
  }
}
