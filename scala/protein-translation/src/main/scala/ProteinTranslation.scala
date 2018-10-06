object ProteinTranslation {
  def proteins(rna: String) =
    rna.grouped(3).map(codonToProtein).takeWhile(_ != "STOP").toList

  private def codonToProtein(codon: String) =
    codon match {
      case "AUG" => "Methionine"
      case "UUC" => "Phenylalanine"
      case "UUU" => "Phenylalanine"
      case "UUA" => "Leucine"
      case "UUG" => "Leucine"
      case "UCU" => "Serine"
      case "UCC" => "Serine"
      case "UCA" => "Serine"
      case "UCG" => "Serine"
      case "UAU" => "Tyrosine"
      case "UAC" => "Tyrosine"
      case "UGU" => "Cysteine"
      case "UGC" => "Cysteine"
      case "UGG" => "Tryptophan"
      case "UAA" => "STOP"
      case "UAG" => "STOP"
      case "UGA" => "STOP"
      case _ => throw new IllegalArgumentException("Unknown codon")
    }
}
