module RunLengthEncoding
  def self.encode(plaintext)  = encode_runs(plaintext).map { |run| encode_run(run) }.join
  def self.decode(ciphertext) = decode_runs(ciphertext).map { |run| decode_run(run) }.join

  private
  def self.encode_run((letter, count)) = "#{count if count > 1}#{letter}"
  def self.decode_run((letter, count)) = "#{letter}" * count

  def self.encode_runs(plaintext)
    plaintext.scan(/(.)(\1*)/).map {|letter, repetitions| [letter, repetitions.size + 1]}.to_a
  end

  def self.decode_runs(ciphertext)
    ciphertext.scan(/(\d*)(.)/).map {|count, letter| [letter, [count.to_i, 1].max]}.to_a
  end
end