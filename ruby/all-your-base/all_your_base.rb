module BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base < 2 || output_base < 2

    return [0] unless digits.any?(&:positive?)

    from_decimal(output_base, to_decimal(input_base, digits.drop_while(&:zero?)))
  end

  def self.to_decimal(from_base, digits)
    digits.reduce(0) do |acc, digit|
      raise ArgumentError if digit.negative? || digit >= from_base

      acc * from_base + digit
    end
  end

  def self.from_decimal(to_base, num)
    digits = []
    remainder = num
    multiplier = 1

    while remainder > 0
      multiplier *= to_base

      value = remainder % multiplier
      digit = value / (multiplier / to_base)

      digits << digit
      remainder -= value
    end

    digits.reverse
  end
end
