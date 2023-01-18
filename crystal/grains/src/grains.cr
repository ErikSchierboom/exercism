module Grains
  def self.square(n)
    raise ArgumentError.new unless n >= 1 && n <= 64

    2i128 ** (n - 1)
  end

  def self.total
    2i128 ** 64 - 1
  end
end
