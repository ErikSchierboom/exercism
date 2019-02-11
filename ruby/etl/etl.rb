module ETL
  def self.transform(old)
    old.each_pair.each_with_object({}) do |(score, letters), new|
      letters.each_with_object(new) do |letter, new|
        new[letter.downcase] = score
      end
    end
  end
end