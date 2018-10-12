enum ListType {
    Equal = "equal",
    Unequal = "unequal",
    Sublist = "sublist",
    Superlist = "superlist",
}

export default class List {
    private items: number[]

    constructor(...items: number[]) {
      this.items = items
    }
  
    public compare(other: List): ListType {
      if (this.items.length === other.items.length) {
        return this.isEqualTo(other) ? ListType.Equal : ListType.Unequal
      } else if (this.items.length < other.items.length) {
        return this.isSublistOf(other) ? ListType.Sublist : ListType.Unequal
      } else {
        return other.isSublistOf(this) ? ListType.Superlist : ListType.Unequal
      }
    }
  
    private isEqualTo(other: List) {
      return this.items.every((x, i) => other.items[i] === x)
    }
  
    private isSublistOf(other: List) {
      if (this.items.length === 0) {
        return true
      }
  
      if (this.items.length > other.items.length) {
        return false;
      }
  
      for (let i = 0; i <= other.items.length - this.items.length; i += 1) {
        const sublist = new List(...other.items.slice(i, i + this.items.length));
  
        if (this.isEqualTo(sublist)) {
          return true;
        }
      }
  
      return false;
    }
  }
  