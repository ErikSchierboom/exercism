export default class List<T> {
  public readonly values: T[];

  constructor(values?: T[]) {
    this.values = values || [];
  }

  foldl<TState>(
    func: (acc: TState, element: T) => TState,
    initial: TState
  ): TState {
    let acc = initial;

    for (const item of this.values) {
      acc = func(acc, item);
    }

    return acc;
  }

  foldr<TState>(
    func: (acc: TState, element: T) => TState,
    initial: TState
  ): TState {
    let acc = initial;

    for (let i = this.values.length - 1; i >= 0; i -= 1)
      acc = func(acc, this.values[i]);

    return acc;
  }

  append(other: List<T>): List<T> {
    return new List(
      other.foldl((acc, elem) => {
        acc.push(elem);
        return acc;
      }, this.values)
    );
  }

  concat(other: List<T>): List<T> {
    return this.append(other);
  }

  map<TOut>(func: (x: T) => TOut): List<TOut> {
    const initial: TOut[] = [];

    return new List<TOut>(
      this.foldl((acc, elem) => {
        acc.push(func(elem));
        return acc;
      }, initial)
    );
  }

  filter(func: (x: T) => boolean): List<T> {
    const initial: T[] = [];

    return new List<T>(
      this.foldl((acc, elem) => {
        if (func(elem)) {
          acc.push(elem);
        }
        return acc;
      }, initial)
    );
  }

  reverse(): List<T> {
    const initial: T[] = [];

    return new List<T>(
      this.foldr((acc, elem) => {
        acc.push(elem);
        return acc;
      }, initial)
    );
  }

  length(): number {
    return this.values.length;
  }
}
