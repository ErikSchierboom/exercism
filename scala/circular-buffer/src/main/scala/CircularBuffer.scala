class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer(var capacity: Int) {
  private val buffer = Array.ofDim[Int](capacity)
  private var readIdx = 0
  private var writeIdx = 0
  private var count = 0

  def write(value: Int) = {
    if (count == capacity) throw new FullBufferException()

    buffer.update(writeIdx, value)
    writeIdx = (writeIdx + 1) % capacity
    count = count + 1
  }

  def read(): Int = {
    if (count == 0) throw new EmptyBufferException()

    val value = buffer(readIdx)
    readIdx = (readIdx + 1) % capacity
    count = count - 1
    value
  }

  def overwrite(value: Int) = {
    if (count == capacity) read()
    write(value)
  }

  def clear() = {
    readIdx = 0
    writeIdx = 0
    count = 0
  }
}