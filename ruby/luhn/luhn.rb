class Luhn
  def self.valid?(number)
    new(number).valid?
  end

  def initialize(number)
    @number = number
  end

  def valid?
    (checksum % 10).zero? unless digits.nil? || digits.size < 2
  end

  private

  attr_reader :number

  def digits
    number
      .delete(' ')
      .match(/^\d{2,}$/) { |m| m.string.each_char.map(&:to_i) }
  end

  def checksum
    digits
      .reverse_each
      .each_slice(2)
      .sum { |even_digit, odd_digit| even_digit + double(odd_digit.to_i) }
  end

  def double(digit)
    doubled = digit * 2
    doubled > 9 ? doubled - 9 : doubled
  end
end