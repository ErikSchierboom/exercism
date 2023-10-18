class CircularBuffer
  def initialize(@size : Int32)
    @elements = [] of Int32
  end

  def read
    raise RuntimeError.new if @elements.empty?

    @elements.pop
  end

  def write(value)
    raise RuntimeError.new if @elements.size == @size

    @elements.unshift(value)
  end

  def overwrite(value)
    @elements.pop if @elements.size == @size

    write(value)
  end

  def clear
    @elements.clear
  end
end
