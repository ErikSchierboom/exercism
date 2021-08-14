ALPHABET = [*'a'..'z']

class Cipher
  attr_reader :key

  def initialize(key = Key.generate)
    raise ArgumentError unless Key.valid?(key)

    @key = key
  end

  def encode(plaintext)
    shift(plaintext, :+)
  end

  def decode(ciphertext)
    shift(ciphertext, :-)
  end

  private
  def shift(str, op)
    str.chars.map.with_index do |c, idx|
      alphabet_idx = ALPHABET.index(c)
      key_idx = ALPHABET.index(key[idx % key.size])
      ALPHABET[alphabet_idx.send(op, key_idx) % ALPHABET.size]
    end.join
  end
end

module Key
  def self.valid?(key)
    key.match(/\A[a-z]+\z/)
  end

  def self.generate
    ALPHABET.sample(100).join
  end
end