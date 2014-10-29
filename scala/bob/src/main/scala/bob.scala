class Bob {

  def getLetters(input: String) = input filter (_.isLetter)
  def isSilence(input: String) = input.trim.isEmpty
  def isQuestion(input: String) = input endsWith "?"
  def isYell(input: String) = !getLetters(input).isEmpty && getLetters(input).forall(_.isUpper)

  def hey(input: String): String = {
    if (isSilence(input)) "Fine. Be that way!"
    else if (isYell(input)) "Whoa, chill out!"
    else if (isQuestion(input)) "Sure."
    else "Whatever."
  }
}