module Squares
  def self.square_of_sum(n)
    (1..n).sum ** 2
  end

  def self.sum_of_squares(n)
    (1..n).map { |n| n ** 2 }.sum
  end

  def self.difference_of_squares(n)
    square_of_sum(n) - sum_of_squares(n)
  end
end
