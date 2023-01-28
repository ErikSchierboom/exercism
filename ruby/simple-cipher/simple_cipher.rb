class Cipher
  ALPHABET = [*'a'..'z'].freeze

  attr_reader :key

  def initialize(key = Key.generate)
    raise ArgumentError unless Key.valid?(key)

    @key = key
  end

  def encode(plaintext) = shift(plaintext, :+)
  def decode(ciphertext) = shift(ciphertext, :-)

  private
  def shift(str, op)
    str.chars.map.with_index do |c, idx|
      alphabet_idx = ALPHABET.index(c)
      key_idx = ALPHABET.index(key[idx % key.size])
      ALPHABET[alphabet_idx.send(op, key_idx) % ALPHABET.size]
    end.join
  end

  module Key
    def self.valid?(key) = key.match(/\A[a-z]+\z/)
    def self.generate = ALPHABET.sample(100).join
  end
end
