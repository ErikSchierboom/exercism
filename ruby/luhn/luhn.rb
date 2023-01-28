module Luhn
  def self.valid?(number)
    return unless clean(number) =~ VALID_NUMBER_REGEX

    checksum(number).zero?
  end

  private
  def self.checksum(number) = clean(number).to_i.then(&method(:luhn_sum)).modulo(10)
  def self.clean(number) = number.delete(' ')

  def self.luhn_sum(number)
    number
      .digits
      .each_slice(2)
      .sum { |even, odd| even + double(odd.to_i) }
  end

  def self.double(digit) = (digit * 2).digits.sum

  VALID_NUMBER_REGEX = /^\d{2,}$/.freeze
  private_constant :VALID_NUMBER_REGEX
end