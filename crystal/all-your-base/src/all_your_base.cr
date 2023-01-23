module AllYourBase
  def self.rebase(input_base : Int32, digits : Array(Int32), output_base : Int32) : Array(Int32)
    raise ArgumentError.new if input_base < 2 || output_base < 2

    return [0] of Int32 unless digits.any? &.positive?

    from_decimal(output_base, to_decimal(input_base, digits.skip_while(&.zero?)))
  end

  def self.to_decimal(from_base : Int32, digits : Array(Int32)) : Int32
    digits.reduce(0) do |acc, digit|
      raise ArgumentError.new if digit.negative? || digit >= from_base

      acc * from_base + digit
    end
  end

  def self.from_decimal(to_base : Int32, num : Int32) : Array(Int32)
    digits = [] of Int32
    remainder = num
    multiplier = 1

    while remainder > 0
      multiplier *= to_base

      value = remainder % multiplier
      digit = value // (multiplier // to_base)

      digits << digit
      remainder -= value
    end

    digits.reverse
  end
end
