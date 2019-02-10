module Luhn
  def self.valid?(number)
    (checksum(digits(number)) % 10).zero?
  end

  private

  def self.digits(number)
    number
      .delete(' ')
      .match(/^\d{2,}$/) { |m| m.string.each_char.map(&:to_i) }
      .to_a
  end

  def self.checksum(digits)
    return -1 if digits.size < 2

    digits
      .reverse_each
      .each_with_index
      .sum { |digit, i| correct_digit(digit, i) }
  end

  def self.correct_digit(digit, index)
    corrected_digit = index.even? ? digit : digit * 2
    corrected_digit > 9 ? corrected_digit - 9 : corrected_digit
  end
end