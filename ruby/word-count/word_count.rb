class Phrase
  def initialize(phrase) = @phrase = phrase

  def word_count = @phrase.downcase.scan(/\w+(?:'\w+)?/).tally
end
