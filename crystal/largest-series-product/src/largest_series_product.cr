class Series
  def initialize(@input : String)
    raise ArgumentError.new unless input.chars.all?(&.ascii_number?)
  end

  def largest_product(span)
    raise ArgumentError.new unless span >= 0 && span <= @input.size

    return 1 if span.zero?

    digits.each_cons(span).map { |series| series.reduce { |product, n| product * n } }.max
  end

  def digits
    @input.chars.map(&.to_i)
  end
end
