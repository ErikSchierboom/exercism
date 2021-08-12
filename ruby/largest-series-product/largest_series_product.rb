class Series
  def initialize(input)
    @input = input
  end

  def largest_product(span)
    raise ArgumentError unless input.match(/^\d*$/)
    raise ArgumentError unless span.between?(0, input.size)

    return 1 if span.zero?

    digits.each_cons(span).map {|series| series.inject(:*) }.max
  end

  private
  attr_reader :input

  def digits
    input.scan(/\d/).map(&:to_i)
  end
end