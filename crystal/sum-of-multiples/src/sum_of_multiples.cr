module SumOfMultiples
  def self.sum(factors, n)
    (1...n).select { |n| factors.select(&.positive?).any? { |factor| n % factor == 0 } }.sum
  end
end
