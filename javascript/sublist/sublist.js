export default class List {
  constructor(items) {
    this.items = items || [];
  }

  compare(other) {
    if (this.items.length === other.items.length) {
      return this.isEqualTo(other) ? "EQUAL" : "UNEQUAL";
    } else if (this.items.length < other.items.length) {
      return this.isSublistOf(other) ? "SUBLIST" : "UNEQUAL";
    } else {
      return other.isSublistOf(this) ? "SUPERLIST" : "UNEQUAL";
    }
  }

  isEqualTo(other) {
    return this.items.every((x, i) => other.items[i] === x);
  }

  isSublistOf(other) {
    if (this.items.length == 0) {
      return true;
    }

    if (this.items.length > other.items.length) {
      return false;
    }

    for (let i = 0; i <= other.items.length - this.items.length; i += 1) {
      const sublist = new List(other.items.slice(i, i + this.items.length));

      if (this.isEqualTo(sublist)) {
        return true;
      }
    }

    return false;
  }
}
