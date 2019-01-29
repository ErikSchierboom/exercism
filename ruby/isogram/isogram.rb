module Isogram
  def self.isogram?(word)
    letters = word.downcase.scan(/\w/)
    letters == letters.uniq
  end
end