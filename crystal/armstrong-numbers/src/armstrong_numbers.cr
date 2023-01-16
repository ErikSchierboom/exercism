module ArmstrongNumbers
  def self.armstrong_number?(number)
    number.digits.sum { |digit| digit ** number.digits.size } == number
  end
end
