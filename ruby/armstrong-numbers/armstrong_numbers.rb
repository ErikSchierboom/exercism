module ArmstrongNumbers
  def self.include?(number)
    armstrong_sum = number.digits.sum { |i| i**number.digits.length }
    armstrong_sum == number
  end
end
