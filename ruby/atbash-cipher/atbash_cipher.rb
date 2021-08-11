module Atbash
  def self.encode(plaintext)
    plaintext
      .downcase
      .scan(/[[:alnum:]]/)
      .map { |letter| ENCODING_MAP[letter] || letter }
      .each_slice(GROUP_SIZE)
      .map { |slice| slice.join('') }
      .join(' ')
  end

  private
  LETTERS = ('a' .. 'z').to_a.freeze
  ENCODING_MAP = LETTERS.zip(LETTERS.reverse).to_h
  GROUP_SIZE = 5
  private_constant :LETTERS, :ENCODING_MAP, :GROUP_SIZE
end