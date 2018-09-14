import scala.util.Random

case class Cipher(suggestedKey: Option[String]) {
  val key = suggestedKey.getOrElse(Cipher.generateKey())
  require(Cipher.validKey(key))

  def charToInt(c: Char) = c - 'a'
  def intToChar (i: Int) = ('a' + (i % 26)).toChar

  def shiftChar(operation: (Int, Int) => Int, char: Char, key: Char) =
    intToChar(operation(charToInt(char), charToInt(key)))

  def shift(operation: (Int, Int) => Int, input: String) =
    input.zip(key).map { case (x, y) => shiftChar(operation, x, y) }.mkString

  def encode(input: String): String = shift(_+_, input)
  def decode(input: String): String = shift(_-_, input)
}

object Cipher {
  val letters = 'a' to 'z'
  val keyLength = 100
  val random = new Random()

  def generateKey() = (0 until keyLength).map(_ => letters(random.nextInt(letters.length))).mkString

  def validKey(key: String) = !key.isEmpty && key.forall(letters.contains)
}