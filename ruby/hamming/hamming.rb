module Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError, 'Strands length must be the same' unless strand1.length == strand2.length

    strand1.each_char.zip(strand2.each_char).count { |x, y| x != y }
  end
end