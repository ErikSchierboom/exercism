module Bob
  def self.hey(sentence)
    case
    when silence?(sentence)           then "Fine. Be that way!"
    when shouting_question?(sentence) then "Calm down, I know what I'm doing!"
    when question?(sentence)          then "Sure."
    when shouting?(sentence)          then "Whoa, chill out!"
    else                                   "Whatever."
    end
  end

  def self.silence?(sentence)
    sentence.strip.empty?
  end

  def self.question?(sentence)
    sentence.rstrip.ends_with?('?')
  end

  def self.shouting?(sentence)
    sentence == sentence.upcase && sentence.match(/[a-zA-z]/)
  end

  def self.shouting_question?(sentence)
    question?(sentence) && shouting?(sentence)
  end
end
