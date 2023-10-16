ALPHABET = [*'a'..'z']

class SimpleCipher
  @key : String

  def initialize(key = Key.generate)
    raise ArgumentError.new unless Key.valid?(key)

    @key = key
  end

  def key
    @key
  end

  def encode(plaintext)
    shift(plaintext) { |alphabet_idx, key_idx| alphabet_idx + key_idx }
  end

  def decode(ciphertext)
    shift(ciphertext) { |alphabet_idx, key_idx| alphabet_idx - key_idx }
  end

  def shift(str, &block)
    str.chars.map_with_index do |c, idx|
      alphabet_idx = ALPHABET.index(c).not_nil!
      key_idx = ALPHABET.index(@key[idx % @key.size]).not_nil!
      shifted_idx = yield alphabet_idx, key_idx
      ALPHABET[shifted_idx % ALPHABET.size]
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
