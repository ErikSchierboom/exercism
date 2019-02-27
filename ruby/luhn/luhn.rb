module Luhn
  VALID_NUMBER_REGEX = /^\d{2,}$/.freeze
  private_constant :VALID_NUMBER_REGEX

  def self.valid?(number)
    sanitized_number = number.delete(' ')

    (sanitized_number.then(&method(:luhn_sum)) % 10).zero? if sanitized_number =~ VALID_NUMBER_REGEX
  end

  private

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