module RotationalCipher
  def self.rotate(plaintext : String, key : Number) : String
    rotate_char = shift_map([*'a'..'z'], key).merge(shift_map([*'A'..'Z'], key))
    plaintext.chars.map { |c| rotate_char.fetch(c, c) }.join
  end

  private def self.shift_map(array, by)
    array.zip(array.rotate(by)).to_h
  end
end
