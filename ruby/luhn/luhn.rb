class Luhn
  def self.valid?(number)
    new(number).valid?
  end

  def initialize(number)
    @number = number.delete(' ')
  end

  def valid?
    (luhn_sum % 10).zero? if digits
  end

  private

  attr_reader :number

  def luhn_sum
    digits
      .reverse_each
      .each_slice(2)
      .sum { |even, odd| even + double(odd.to_i) }
  end

  def digits
    number.each_char.map(&:to_i) if digits_valid?
  end

  def digits_valid?
    number =~ /^\d{2,}$/
  end

  def double(digit)
    doubled = digit * 2
    doubled < 10 ? doubled : doubled - 9
  end
end