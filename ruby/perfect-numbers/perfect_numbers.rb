class PerfectNumber
  def self.classify(number)
    new(number).classify
  end

  def initialize(number)
    @number = number
  end

  def classify
    raise 'Number must be positive' unless number >= 0

    return 'deficient' if aliquot_sum < number
    return 'abundant' if aliquot_sum > number

    'perfect'
  end

  private

  attr_reader :number

  def aliquot_sum
    factors.sum
  end

  def factors
    1.upto(number / 2).select { |n| number.remainder(n).zero? }
  end
end