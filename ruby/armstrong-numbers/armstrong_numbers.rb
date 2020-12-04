module ArmstrongNumbers
  def self.include?(number)
    digits = number.digits
    armstrong_sum = digits.sum { |i| i**digits.length }
    armstrong_sum == number
  end
end