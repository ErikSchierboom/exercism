class Luhn
  VALID_NUMBER_REGEX = /^\d{2,}$/.freeze
  private_constant :VALID_NUMBER_REGEX

  def self.valid?(number)
    new(number).valid?
  end

  def initialize(number)
    @number = number.delete(' ')
  end

  def valid?
    return unless number_valid?

    (luhn_sum % 10).zero?
  end

  private

  attr_reader :number

  def number_valid?
    number =~ VALID_NUMBER_REGEX
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