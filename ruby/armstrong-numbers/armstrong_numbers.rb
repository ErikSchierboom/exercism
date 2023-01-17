module ArmstrongNumbers
  def self.include?(number)
    number.digits.sum { |digit| digit**number.digits.length } == number
  end
end
