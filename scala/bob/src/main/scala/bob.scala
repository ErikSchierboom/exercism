class Bob {
  def isSilence(str: String) = str.forall(_.isWhitespace)
  def isQuestion(str: String) = str.endsWith("?")
  def isYell(str: String) = str.exists(_.isUpper) && !str.exists(_.isLower)

  def hey(str: String): String = str match {
    case s if isSilence(s) => "Fine. Be that way!"
    case s if isYell(s) => "Whoa, chill out!"
    case s if isQuestion(s) => "Sure."
    case _ => "Whatever."
  }
}