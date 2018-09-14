import scala.util.Random

class Robot {
  val WordCharactersCount = 2
  val DigitCharactersCount = 3
  val random = new Random()

  var name = generateName

  def generateWordCharacters: String = random.alphanumeric.take(WordCharactersCount).mkString
  def generateDigitCharacters: String = random.alphanumeric.filter(_.isDigit).take(DigitCharactersCount).mkString

  def generateName: String = generateWordCharacters + generateDigitCharacters
  
  def reset() = name = generateName
}