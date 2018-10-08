import scala.annotation.tailrec

object VariableLengthQuantity {
  private val SevenBitsMask = 0x7f
  private val EightBitMask = 0x80

  def encode(bytes: List[Int]): List[Int] = bytes.flatMap(encodeHelper)

  private def encodeHelper(byte: Int): List[Int] = {
    @tailrec
    def encodeByte(bytes: List[Int], remainder: Int): List[Int] = {
      if (remainder == 0) {
        bytes
      } else {
        val maskedBytes =
          if (bytes.isEmpty)
            remainder & SevenBitsMask
          else
            remainder & SevenBitsMask | EightBitMask

        encodeByte(maskedBytes :: bytes, remainder >>> 7)
      }
    }

    if (byte == 0) List(0) else encodeByte(List(), byte)
  }

  def decode(encodedBytes: List[Int]): Either[String, List[Int]] = decodeHelper(0x0, List(), encodedBytes)

  @tailrec
  private def decodeHelper(decodedValue: Int, decodedBytes: List[Int], encodedBytes: List[Int]): Either[String, List[Int]] = {
    encodedBytes match {
      case Nil =>
        if (decodedValue == 0 && decodedBytes.nonEmpty)
          Right(decodedBytes.reverse)
        else
          Left("Incomplete byte sequence")
      case x :: xs =>
        if ((decodedValue & 0xfe000000) > 0) {
          Left("Overflow exception")
        }
        else {
          val value = (decodedValue << 7) | (x & SevenBitsMask)
          if ((EightBitMask & x) == 0)
            decodeHelper(0, value :: decodedBytes, xs)
          else
            decodeHelper(value, decodedBytes, xs)
        }
    }
  }
}
