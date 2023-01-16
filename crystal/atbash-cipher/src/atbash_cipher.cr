module AtbashCipher
  DIGITS       = ('0'..'9').to_a
  LETTERS      = ('a'..'z').to_a
  ENCODING_MAP = (LETTERS + DIGITS).zip(LETTERS.reverse + DIGITS).to_h

  def self.encode(plaintext)
    transpose(plaintext).each_slice(5).map(&.join).join(" ")
  end

  def self.decode(ciphertext)
    transpose(ciphertext).join
  end

  def self.transpose(text)
    text
      .downcase
      .chars
      .select(&.alphanumeric?)
      .map { |letter| ENCODING_MAP[letter] }
  end
end
