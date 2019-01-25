class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(max)
    (1...max).select { |n| @factors.any? { |factor| n % factor == 0 } }.sum
  end
end