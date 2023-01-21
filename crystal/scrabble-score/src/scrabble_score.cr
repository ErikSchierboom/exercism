module ScrabbleScore
  def self.score(word : String) : Int32
    word.upcase.chars.sum { |letter| score(letter) }
  end

  def self.score(letter : Char) : Int32
    case letter
    when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' then 1
    when 'D', 'G'                                         then 2
    when 'B', 'C', 'M', 'P'                               then 3
    when 'F', 'H', 'V', 'W', 'Y'                          then 4
    when 'K'                                              then 5
    when 'J', 'X'                                         then 8
    when 'Q', 'Z'                                         then 10
    else                                                       raise ArgumentError.new
    end
  end
end
