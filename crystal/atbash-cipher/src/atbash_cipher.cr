module AtbashCipher
  LETTERS      = ('a'..'z').to_a
  ENCODING_MAP = LETTERS.zip(LETTERS.reverse).to_h
  GROUP_SIZE   = 5

  def self.encode(plaintext)
    plaintext
      .downcase
      .chars
      .select(&.alphanumeric?)
      .map { |letter| encode_letter(letter) }
      .each_slice(GROUP_SIZE)
      .map(&.join)
      .join(" ")
  end

  def self.decode(ciphertext)
    ciphertext.delete(" ")
      .chars
      .map { |letter| encode_letter(letter) }
      .join
  end

  def self.encode_letter(letter)
    ENCODING_MAP.fetch(letter, letter)
  end
end
