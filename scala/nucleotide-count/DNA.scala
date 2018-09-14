sealed abstract class Nucleotide(val letter: Char)
case object Adenine extends Nucleotide('A')
case object Cytosine extends Nucleotide('C')
case object Guanine extends Nucleotide('G')
case object Thymine extends Nucleotide('T')

class DNA(val str: String) {
  lazy val nucleotideCounts = str.map(toNucleotide)
                                 .groupBy(identity)
                                 .map { case (nucleotide, instances) => (nucleotide.letter, instances.length) }
                                 .withDefaultValue(0)

  def toNucleotide(c: Char): Nucleotide = c match {
    case 'A' => Adenine
    case 'C' => Cytosine
    case 'G' => Guanine
    case 'T' => Thymine
    case _ => throw new IllegalArgumentException
  }

  def count(c: Char): Int = nucleotideCounts(c)
}