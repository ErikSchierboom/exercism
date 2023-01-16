module Binary
  def self.to_decimal(binary)
    binary.chars.reduce(0) do |acc, c|
      raise ArgumentError.new unless c == '0' || c == '1'

      acc * 2 + (c - '0')
    end
  end
end
