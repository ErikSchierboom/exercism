module RunLengthEncoding
  def self.encode(plaintext)
    encode_runs(plaintext).map(&method(:encode_run)).join('')
  end

  def self.decode(ciphertext)
    decode_runs(ciphertext).map(&method(:decode_run)).join('')
  end

  private
  def self.encode_run((letter, count))
    "#{count if count > 1}#{letter}"
  end

  def self.decode_run((letter, count))
    "#{letter}" * count
  end

  def self.encode_runs(plaintext)
    plaintext.scan(/(.)(\1*)/).map {|letter, repetitions| [letter, repetitions.size + 1]}.to_a
  end

  def self.decode_runs(ciphertext)
    ciphertext.scan(/(\d*)(.)/).map {|count, letter| [letter, [count.to_i, 1].max]}.to_a
  end
end