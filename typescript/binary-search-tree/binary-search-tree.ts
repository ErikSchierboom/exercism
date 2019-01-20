export default class BinarySearchTree {
  private _data: number;
  private _left: BinarySearchTree;
  private _right: BinarySearchTree;

  constructor(data: number) {
    this._data = data;
  }

  public get data(): number {
    return this._data;
  }

  public get left(): BinarySearchTree {
    return this._left;
  }

  public get right(): BinarySearchTree {
    return this._right;
  }

  public insert(value: number): void {
    if (value <= this._data) {
      if (this._left) {
        this._left.insert(value);
      } else {
        this._left = new BinarySearchTree(value);
      }
    } else {
      if (this._right) {
        this._right.insert(value);
      } else {
        this._right = new BinarySearchTree(value);
      }
    }
  }

  public each(callback: (data: number) => void): void {
    if (this._left) {
      this._left.each(callback);
    }

    callback(this._data);

    if (this._right) {
      this._right.each(callback);
    }
  }
}
