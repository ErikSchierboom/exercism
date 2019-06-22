module Atbash
  def self.encode(plaintext)
    plaintext
      .scan(/[[:alnum:]]/)
      .map(&method(:encode_letter))
      .each_slice(GROUP_SIZE)
      .map { |slice| slice.join('') }
      .join(' ')
  end

  def self.encode_letter(letter)
    ENCODED_LETTERS[PLAINTEXT_LETTERS.index(letter.downcase)]
  end

  private

  PLAINTEXT_LETTERS = 'abcdefghijklmnopqrstuvwxyz0123456789'.freeze
  ENCODED_LETTERS = 'zyxwvutsrqponmlkjihgfedcba0123456789'.freeze
  GROUP_SIZE = 5
  private_constant :PLAINTEXT_LETTERS, :ENCODED_LETTERS, :GROUP_SIZE
end