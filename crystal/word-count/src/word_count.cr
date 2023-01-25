module WordCount
  def self.count_words(sentence : String) : Hash(String, Int32)
    sentence.downcase.scan(/\w+(?:'\w+)?/).map(&.[0]).tally
  end
end
