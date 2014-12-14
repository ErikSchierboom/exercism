class CryptoSquare {
  private val PadString = " ";

  private def transpose(segments: List[String]): List[String] =
    segments match {
      case Nil => Nil
      case x::xs => segments.map(_.padTo(x.length, PadString))
                            .transpose
                            .map(_.mkString.replaceAll(PadString, ""))
    }

  def normalizePlaintext(plainText: String) = plainText.trim.filter(_.isLetterOrDigit).toLowerCase

  def squareSize(plainText: String) = Math.ceil(Math.sqrt(plainText.length)).toInt

  def plaintextSegments(plainText: String) = {
    normalizePlaintext(plainText) match {
      case "" => Nil
      case normalized => normalized.grouped(squareSize(normalized)).toList
    }
  }

  def ciphertext(plainText: String) = transpose(plaintextSegments(plainText)).mkString

  def normalizedCiphertext(plainText: String) = transpose(plaintextSegments(plainText)).mkString(" ")
}

object CryptoSquare {
  def apply() = new CryptoSquare
}
