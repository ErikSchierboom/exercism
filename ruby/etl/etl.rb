module ETL
  def self.transform(old)
    old.flat_map do |(score, letters)|
      letters.map(&:downcase).product([score])
    end.to_h
  end
end