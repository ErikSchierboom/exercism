module ArmstrongNumbers
  def self.include?(number)
    number.digits.sum { |digit| digit ** number.digits.size } == number
  end
end
