class SumOfMultiples
  def initialize(*factors) = @factors = factors

  def to(max) = (1...max).select { |n| @factors.any? { |factor| (n % factor).zero? } }.sum
end