class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @size = size
    @elements = []
  end

  def read
    raise BufferEmptyException if elements.empty?

    elements.pop
  end

  def write(value)
    raise BufferFullException if elements.size == size

    elements.unshift(value)
  end

  def write!(value)
    elements.pop if elements.size == size
    
    write(value)
  end

  def clear
    elements.clear
  end

  private
  attr_reader :size, :elements
end