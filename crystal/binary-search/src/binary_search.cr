class BinarySearch
  def initialize(@values : Array(Int32))
  end

  def find(value)
    find(value, 0, @values.size - 1)
  end

  def find(value, min, max)
    raise ArgumentError.new if min > max

    idx = min + (max - min) // 2

    case value <=> @values[idx]
    when .negative? then find(value, min, idx - 1)
    when .zero?     then idx
    when .positive? then find(value, idx + 1, max)
    end
  end
end
