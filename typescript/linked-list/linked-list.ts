class Node<T> {
    public data: T
    public previous?: Node<T>
    public next?: Node<T>

    constructor(data: T, previous?: Node<T>, next?: Node<T>) {
        this.data = data
        this.previous = previous
        this.next = next
    }
}

export default class LinkedList<T> {
    private first?: Node<T> = undefined
    private last?: Node<T> = undefined
    private _count = 0

    public push(value: T) {
        if (this.last === undefined) {
            this.addToEmptyList(value)
        } else {
            this.last = this.last.next = new Node(value, this.last, undefined)
        }

        this.itemAdded()
    }

    public pop() {
        if (this.last === undefined) {
            throw new Error('Cannot pop on empty list')
        }

        const value = this.last.data
        this.last = this.last.previous

        if (this.last !== undefined) {
            this.last.next = undefined
        } else {
            this.first = undefined
        }

        this.itemRemoved()

        return value
    }

    public unshift(value: T) {
        if (this.first === undefined) {
            this.addToEmptyList(value)
        } else {
            this.first = this.first.previous = new Node(value, undefined, this.first)
        }

        this.itemAdded()
    }

    public shift() {
        if (this.first === undefined) {
            throw new Error('Cannot shift on empty list')
        }

        const value = this.first.data
        this.first = this.first.next

        if (this.first !== undefined) {
            this.first.previous = undefined
        } else {
            this.last = undefined
        }

        this.itemRemoved()

        return value
    }

    count() {
        return this._count
    }

    delete(value: T) {
        let current = this.first

        while (current !== undefined) {
            if (current.data === value) {
                if (current.next) {
                    current.next.previous = current.previous
                }

                if (current.previous) {
                    current.previous.next = current.next
                }

                if (current === this.first) {
                    this.first = current.next
                }

                if (current === this.last) {
                    this.last = current.previous
                }

                this.itemRemoved()

                return
            }

            current = current.next
        }
    }

    private addToEmptyList(value: T) {
        this.first = this.last = new Node(value)
    }

    private itemAdded() {
        this._count++
    }

    private itemRemoved() {
        this._count--
    }
}