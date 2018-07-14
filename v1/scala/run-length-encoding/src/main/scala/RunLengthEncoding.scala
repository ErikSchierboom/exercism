import scala.util.matching.Regex.MatchIterator

object RunLengthEncoding {

  def encode(str: String): String =
    partitionsToEncode(str).map(encodePartition).mkString

  def encodePartition(partition: Seq[Char]): String =
    if (partition.length > 1) s"${partition.length}${partition.head}"
    else partition.mkString

  def partitionsToEncode[T](seq: Seq[T]) : Seq[Seq[T]] =
    seq match {
      case Seq() => Seq()
      case hd +: tl =>
        val segment = seq.takeWhile(_ == hd)
        segment +: partitionsToEncode(seq.drop(segment.length))
    }

  def decode(str: String): String =
    partitionsToDecode(str).map(decodePartition).mkString

  def decodePartition(str: String) =
    if (str.length == 1) str
    else List.fill(str.substring(0, str.length - 1).toInt)(str.last).mkString

  def partitionsToDecode(str: String): MatchIterator = """(\d+.|.)""".r.findAllIn(str)
}
