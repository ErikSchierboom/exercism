export class ElementValueRequiredException extends Error { }

export class ElementNextNotInstanceException extends Error { }

export class Element {
  constructor(value, next) {
    if (!value) {
      throw new ElementValueRequiredException();
    }

    if (next !== undefined && !(next instanceof Element)) {
      throw new ElementNextNotInstanceException();
    }

    this.value = value;
    this.next = next;
  }
}

export class List {
  constructor() {
    this.head = undefined;
  }

  push(element) {
    if (this.head === undefined) {
      this.head = element;
    } else {
      let last = this.head;
      let current = this.head.next;

      while (current !== undefined) {
        last = current;
        current = current.next;
      }

      last.next = element;
    }
  }

  unshift(element) {
    if (this.head === undefined) {
      this.head = element;
    } else {
      const currentHead = this.head;
      this.head = element;
      this.head.next = currentHead;
    }
  }

  shift() {
    if (this.head.next === undefined) {
      this.head = undefined;
    } else {
      this.head = this.head.next;
    }
  }

  pop() {
    if (this.head.next === undefined) {
      this.head = undefined;
    } else {
      this.head = this.head.next;
    }
  }

  reverse() {
    let previous;
    let next;
    let current = this.head;

    while (current !== undefined) {
      next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }

    this.head = previous;
  }

  toArray() {
    const elements = [];
    let currentElement = this.head;

    while (currentElement !== undefined) {
      elements.push(currentElement.value);
      currentElement = currentElement.next;
    }

    return elements;
  }

  static fromArray(values) {
    return values.reduce((list, value) => {
      list.push(new Element(value));
      return list;
    }, new List());
  }
}
