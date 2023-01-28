class PerfectNumber
  def self.classify(number) = new(number).classify

  def initialize(number) = @number = number

  def classify
    raise 'Number must be positive' if @number.negative?

    case aliquot_sum <=> @number
    when -1 then 'deficient'
    when  0 then 'perfect'
    when  1 then 'abundant'
    end
  end

  private
  def aliquot_sum = factors.sum
  def factors = 1.upto(@number / 2).select { |n| @number.remainder(n).zero? }
end