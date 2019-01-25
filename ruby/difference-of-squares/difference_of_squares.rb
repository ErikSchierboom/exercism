class Squares
  def initialize(max)
    @numbers = 1..max
  end

  def square_of_sum
    @numbers.sum ** 2
  end

  def sum_of_squares
    @numbers.map { |n| n ** 2 }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end