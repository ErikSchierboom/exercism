module Luhn
  def self.valid?(input : String) : Bool
    digits = input.chars.reject &.whitespace?
    return false if digits.size < 2

    checksum = 0

    digits.reverse.each_with_index do |c, i|
      digit = c.to_i?
      return false if digit.nil?

      multiplied = digit * (1 + i % 2)
      multiplied -= 9 if multiplied > 9

      checksum += multiplied
    end

    (checksum % 10).zero?
  end
end
