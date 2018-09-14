import scala.util.Try

object SecretHandshake {
  val commands =
    List(
      (1 << 0, (acc: List[String]) => acc :+ "wink"),
      (1 << 1, (acc: List[String]) => acc :+ "double blink"),
      (1 << 2, (acc: List[String]) => acc :+ "close your eyes"),
      (1 << 3, (acc: List[String]) => acc :+ "jump"),
      (1 << 4, (acc: List[String]) => acc.reverse))

  def handshake(number: Int): List[String] = commands.foldLeft[List[String]](Nil) {
    case (acc, (mask, applyCommand)) =>
      if ((number & mask) != 0) applyCommand(acc)
      else acc
  }

  def handshake(input: String): List[String] = tryParseBinary(input).map(handshake).getOrElse(Nil)

  def tryParseBinary(input: String) =
    input.foldLeft[Option[Int]](Some(0)) {
      case (Some(acc), '0') => Some(acc * 2)
      case (Some(acc), '1') => Some(acc * 2 + 1)
      case (_, _) => None
    }
}