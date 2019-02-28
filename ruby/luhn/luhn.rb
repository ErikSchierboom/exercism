module Luhn
  VALID_NUMBER_REGEX = /^\d{2,}$/.freeze
  private_constant :VALID_NUMBER_REGEX

  def self.valid?(number)
    return unless clean(number) =~ VALID_NUMBER_REGEX

    number
      .then(&method(:clean))
      .then(&method(:luhn_sum))
      .modulo(10)
      .zero?
  end

  private

  def self.clean(number)
    number.delete(' ')
  end

  def self.luhn_sum(number)
    number
      .to_i
      .digits
      .each_slice(2)
      .sum { |even, odd| even + double(odd.to_i) }
  end

  def self.double(digit)
    (digit * 2).digits.sum
  end
end