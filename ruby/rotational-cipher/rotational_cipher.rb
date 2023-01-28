module RotationalCipher
  def self.rotate(plaintext, by)
    rotate_char = shift_map([*'a'..'z'], by).merge(shift_map([*'A'..'Z'], by))
    plaintext.chars.map {|c| rotate_char.fetch(c, c)}.join
  end

  private
  def self.shift_map(array, by) = array.zip(array.rotate(by)).to_h
end