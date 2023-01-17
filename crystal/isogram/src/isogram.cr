module Isogram
  def self.isogram?(word)
    letters = word.downcase.chars.select(&.alphanumeric?)
    letters == letters.uniq
  end
end
