module Isogram
  def self.isogram?(word)
    letters = word.downcase.scan(/\w/)
    letters.length == letters.uniq.length
  end
end