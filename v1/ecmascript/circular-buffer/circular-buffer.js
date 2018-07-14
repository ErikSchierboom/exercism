class CircularBuffer {
    constructor(size) {
        this.size = size;
        this.items = [];
    }

    read() {
        if (this.items.length === 0)
            throw bufferEmptyException();

        const [value] = this.items.splice(0, 1);
        return value;
    }

    write(value) {
        if (this.items.length >= this.size)
            throw bufferFullException();

        if (value === null || value === undefined)
            return;
        
        this.items.push(value);
    }

    forceWrite(value) {
        if (this.items.length >= this.size)
            this.read();
        
        this.write(value);
    }

    clear() {
        this.items = [];
    }
}

export const bufferEmptyException = () => ({
    name: 'bufferEmptyException',
    message: 'Buffer is empty'
  });

export const bufferFullException = () => ({
    name: 'bufferFullException',
    message: "Buffer is full"
  });

export default function circularBuffer(size) {
    return new CircularBuffer(size);
}