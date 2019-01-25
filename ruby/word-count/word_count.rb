class Phrase
  attr_reader :word_count

  def initialize(phrase)
    @word_count = count_words(words(phrase))
  end

  private

  def words(phrase)
    phrase.downcase.scan(/\w+(?:'\w+)?/)
  end

  def count_words(words)
    words.reduce(Hash.new(0)) { |hash, word| hash.update(word => hash[word] + 1) }
  end
end
