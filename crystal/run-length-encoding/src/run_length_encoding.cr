module RunLengthEncoding
  def self.encode(plaintext)
    encode_runs(plaintext).map { |run| encode_run(run) }.join
  end

  def self.decode(ciphertext)
    decode_runs(ciphertext).map { |run| decode_run(run) }.join
  end

  def self.encode_runs(plaintext)
    plaintext.scan(/(.)(\1*)/).map { |(_, letter, repetitions)| {letter: letter, count: repetitions.size + 1} }
  end

  def self.decode_runs(ciphertext)
    ciphertext.scan(/(\d*)(.)/).map { |(_, count, letter)| {letter: letter, count: count.to_i { 1 }} }
  end

  def self.encode_run(run)
    "#{run[:count] if run[:count] > 1}#{run[:letter]}"
  end

  def self.decode_run(run)
    Array.new(run[:count], run[:letter]).join
  end
end
