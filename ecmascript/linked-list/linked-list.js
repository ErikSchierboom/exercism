class Node {
    constructor(data, previous = null, next = null) {
        this._data = data;
        this._previous = previous;
        this._next = next;
    }

    get data() {
        return this._data;
    }

    get previous() {
        return this._previous;
    }

    set previous(value) {
        this._previous = value;
    }

    get next() {
        return this._next;
    }

    set next(value) {
        this._next = value;
    }
}

export default class LinkedList {
    constructor() {
        this.first = null;
        this.last = null;
        this._count = 0;
    }

    push(value) {
        if (this.last == null) {
            this.addToEmptyList(value);
        } else {
            this.last = this.last.next = new Node(value, this.last, null);
        }

        this.itemAdded();
    }

    pop() {
        const value = this.last.data;
        this.last = this.last.previous;

        if (this.last !== null)
            this.last.next = null;
        else
            this.first = null;

        this.itemRemoved();

        return value;
    }

    unshift(value) {
        if (this.first == null) {
            this.addToEmptyList(value);
        } else {
            this.first = this.first.previous = new Node(value, null, this.first);
        }

        this.itemAdded();
    }

    shift() {
        const value = this.first.data;
        this.first = this.first.next;

        if (this.first !== null)
            this.first.previous = null;
        else
            this.last = null;

        this.itemRemoved();

        return value;
    }

    count() {
        return this._count;
    }

    delete(value) {
        let current = this.first;

        while (current !== null) {
            if (current.data === value) {
                if (current.next)
                    current.next.previous = current.previous

                if (current.previous)
                    current.previous.next = current.next;

                if (current === this.first)
                    this.first = current.next;

                if (current === this.last)
                    this.last = current.previous;

                this.itemRemoved();

                return;
            }

            current = current.next;
        }
    }

    addToEmptyList(value) {
        this.first = this.last = new Node(value);
    }

    itemAdded() {
        this._count++;
    }

    itemRemoved() {
        this._count--;
    }
}