module Bob
  def self.hey(sentence)
    if silence?(sentence)
      "Fine. Be that way!"
    elsif question?(sentence) && shouting?(sentence)
      "Calm down, I know what I'm doing!"
    elsif question?(sentence)
      "Sure."
    elsif shouting?(sentence)
      "Whoa, chill out!"
    else
      "Whatever."
    end
  end

  private
  def self.silence?(sentence) = sentence.strip.empty?
  def self.question?(sentence) = sentence.rstrip.end_with?('?')
  def self.shouting?(sentence) = sentence == sentence.upcase && sentence.match(/[a-zA-z]/)
end