class Luhn
  def self.valid?(number)
    new(number).valid?
  end

  def initialize(number)
    @number = number.delete(' ')
  end

  def valid?
    (luhn_sum % 10).zero? if number_valid?
  end

  private

  attr_reader :number

  def number_valid?
    number =~ /^\d{2,}$/
  end

  def luhn_sum
    number
      .to_i
      .digits
      .each_slice(2)
      .sum { |even, odd| even + double(odd.to_i) }
  end

  def double(digit)
    (digit * 2).digits.sum
  end
end