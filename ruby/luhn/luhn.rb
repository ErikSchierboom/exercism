module Luhn
  module_function

  VALID_NUMBER_REGEX = /^\d{2,}$/.freeze
  private_constant :VALID_NUMBER_REGEX

  def valid?(number)
    return unless clean(number) =~ VALID_NUMBER_REGEX

    clean(number)
      .to_i
      .then(&method(:luhn_sum))
      .modulo(10)
      .zero?
  end

  def clean(number)
    number.delete(' ')
  end

  def luhn_sum(number)
    number
      .digits
      .each_slice(2)
      .sum { |even, odd| even + double(odd.to_i) }
  end

  def double(digit)
    (digit * 2).digits.sum
  end
end