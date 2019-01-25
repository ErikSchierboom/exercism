module Grains
  def self.square(n)
    raise ArgumentError, "n must be >= 1 and <= 64" unless n >= 1 && n <= 64

    2**(n - 1)
  end

  def self.total
    2**64 - 1
  end
end