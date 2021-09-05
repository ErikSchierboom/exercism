export default class List {
  constructor(values) {
    this.values = values || [];
  }

  foldl(func, initial) {
    let acc = initial;

    for (const item of this.values) {
      acc = func(acc, item);
    }

    return acc;
  }

  foldr(func, initial) {
    let acc = initial;

    for (let i = this.values.length - 1; i >= 0; i--)
      acc = func(acc, this.values[i]);

    return acc;
  }

  append(other) {
    return new List(
      other.foldl((acc, elem) => {
        acc.push(elem);
        return acc;
      }, this.values)
    );
  }

  concat(other) {
    return this.append(other);
  }

  map(func) {
    return new List(
      this.foldl((acc, elem) => {
        acc.push(func(elem));
        return acc;
      }, [])
    );
  }

  filter(func) {
    return new List(
      this.foldl((acc, elem) => {
        if (func(elem)) {
          acc.push(elem);
        }
        return acc;
      }, [])
    );
  }

  reverse() {
    return new List(
      this.foldr((acc, elem) => {
        acc.push(elem);
        return acc;
      }, [])
    );
  }

  length() {
    return this.values.length;
  }
}
