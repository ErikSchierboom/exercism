export default class Triangle {
  private size: number;

  constructor(size: number) {
    this.size = size;
  }

  get rows(): number[][] {
    let acc = [];

    for (let i = 1; i <= this.size; i++) acc.push(this.row(i));

    return acc;
  }

  get lastRow(): number[] {
    return this.row(this.size);
  }

  row(n: number): number[] {
    let digits = [1];
    let column = 1;

    for (let j = 1; j < n; j++) {
      column = (column * (n - j)) / j;
      digits.push(column);
    }

    return digits;
  }
}
