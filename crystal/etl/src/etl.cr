module ETL
  def self.transform(old)
    old.flat_map { |(score, letters)| letters.map { |letter| [letter.downcase, score.to_i] } }.to_h
  end
end
