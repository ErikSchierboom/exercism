class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @phrase
      .downcase
      .scan(/\w+(?:'\w+)?/)
      .each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
  end
end
