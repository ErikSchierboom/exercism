export default class CircularBuffer<T> {
    size: number
    items: T[]

    constructor(size: number) {
        this.size = size
        this.items = []
    }

    read(): T {
        if (this.items.length === 0) {
            throw new BufferEmptyError()
        }

        const [value] = this.items.splice(0, 1)
        return value
    }

    write(value: T): void {
        if (this.items.length >= this.size) {
            throw new BufferOverflowError()
        }

        if (value === null || value === undefined) {
            return
        }

        this.items.push(value)
    }

    forceWrite(value: T): void {
        if (this.items.length >= this.size) {
            this.read()
        }

        this.write(value)
    }

    clear(): void {
        this.items = []
    }
}

export class BufferEmptyError extends Error { }

export class BufferOverflowError extends Error { }