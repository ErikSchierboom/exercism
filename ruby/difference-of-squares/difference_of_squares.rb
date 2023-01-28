class Squares
  def initialize(max) = @numbers = 1..max

  def square_of_sum = @numbers.sum ** 2
  def sum_of_squares = @numbers.sum { |n| n ** 2 }
  def difference = square_of_sum - sum_of_squares
end