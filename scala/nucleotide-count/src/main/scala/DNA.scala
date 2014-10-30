sealed abstract class Nucleotide(val letter: Char)
case object Adenine extends Nucleotide('A')
case object Cytosine extends Nucleotide('C')
case object Guanine extends Nucleotide('G')
case object Thymine extends Nucleotide('T')

class DNA(val str: String) {
  val lettersWithCount = nucleotidesCountMap

  def nucleotidesCountMap = stringToNucleotides.groupBy(identity)
                                               .map { case (nucleotide, instances) => (nucleotide.letter, instances.length) }

  def stringToNucleotides = str.map(charToNucleotide)

  def charToNucleotide(c: Char): Nucleotide = c match {
    case 'A' => Adenine
    case 'C' => Cytosine
    case 'G' => Guanine
    case 'T' => Thymine
    case _ => throw new IllegalArgumentException
  }

  def count(c: Char): Int = lettersWithCount.getOrElse(c, 0)
  def nucleotideCounts: Map[Char, Int] = lettersWithCount
}
