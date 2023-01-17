module Hamming
  def self.distance(strand1, strand2)
    raise ArgumentError.new unless strand1.size == strand2.size

    strand1.chars.zip(strand2.chars).count { |letter1, letter2| letter1 != letter2 }
  end
end
