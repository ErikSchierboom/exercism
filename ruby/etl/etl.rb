module ETL
  def self.transform(old)
    old.each_with_object({}) do |(score, letters), transformed|
      letters.each do |letter|
        transformed[letter.downcase] = score
      end
    end
  end
end