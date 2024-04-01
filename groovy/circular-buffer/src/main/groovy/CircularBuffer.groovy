class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer {
    private int capacity
    private int count
    private int readIdx
    private int writeIdx
    private int[] buffer;

    CircularBuffer(int capacity) {
        this.capacity = capacity
        buffer = new int[capacity];
    }

    def clear() {
        count = 0
        readIdx = 0
        writeIdx = 0
    }

    def read() {
        if (count == 0) throw new EmptyBufferException()
        def item = buffer[readIdx]
        readIdx = (readIdx + 1) % capacity
        count--
        item
    }

    def write(int item) {
        if (count == capacity) throw new FullBufferException()
        buffer[writeIdx] = item
        writeIdx = (writeIdx + 1) % capacity
        count++
    }

    def overwrite(int item) {
        if (count == capacity) read()
        write(item)
    }
}
