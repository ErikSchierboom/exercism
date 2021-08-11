module Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError unless strand1.length == strand2.length

    strand1.chars.zip(strand2.chars).count { |letter1, letter2| letter1 != letter2 }
  end
end