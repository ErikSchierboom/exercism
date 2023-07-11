import org.scalatest.{Matchers, FunSuite}

/** @version 1.1.0 */
class ProteinTranslationTest extends FunSuite with Matchers {

  test("Methionine RNA sequence") {
    ProteinTranslation.proteins("AUG") should be(Seq("Methionine"))
  }

  test("Phenylalanine RNA sequence 1") {
    ProteinTranslation.proteins("UUU") should be(Seq("Phenylalanine"))
  }

  test("Phenylalanine RNA sequence 2") {
    ProteinTranslation.proteins("UUC") should be(Seq("Phenylalanine"))
  }

  test("Leucine RNA sequence 1") {
    ProteinTranslation.proteins("UUA") should be(Seq("Leucine"))
  }

  test("Leucine RNA sequence 2") {
    ProteinTranslation.proteins("UUG") should be(Seq("Leucine"))
  }

  test("Serine RNA sequence 1") {
    ProteinTranslation.proteins("UCU") should be(Seq("Serine"))
  }

  test("Serine RNA sequence 2") {
    ProteinTranslation.proteins("UCC") should be(Seq("Serine"))
  }

  test("Serine RNA sequence 3") {
    ProteinTranslation.proteins("UCA") should be(Seq("Serine"))
  }

  test("Serine RNA sequence 4") {
    ProteinTranslation.proteins("UCG") should be(Seq("Serine"))
  }

  test("Tyrosine RNA sequence 1") {
    ProteinTranslation.proteins("UAU") should be(Seq("Tyrosine"))
  }

  test("Tyrosine RNA sequence 2") {
    ProteinTranslation.proteins("UAC") should be(Seq("Tyrosine"))
  }

  test("Cysteine RNA sequence 1") {
    ProteinTranslation.proteins("UGU") should be(Seq("Cysteine"))
  }

  test("Cysteine RNA sequence 2") {
    ProteinTranslation.proteins("UGC") should be(Seq("Cysteine"))
  }

  test("Tryptophan RNA sequence") {
    ProteinTranslation.proteins("UGG") should be(Seq("Tryptophan"))
  }

  test("STOP codon RNA sequence 1") {
    ProteinTranslation.proteins("UAA") should be(Seq())
  }

  test("STOP codon RNA sequence 2") {
    ProteinTranslation.proteins("UAG") should be(Seq())
  }

  test("STOP codon RNA sequence 3") {
    ProteinTranslation.proteins("UGA") should be(Seq())
  }

  test("Translate RNA strand into correct protein list") {
    ProteinTranslation.proteins("AUGUUUUGG") should be(
      Seq("Methionine", "Phenylalanine", "Tryptophan"))
  }

  test("Translation stops if STOP codon at beginning of sequence") {
    ProteinTranslation.proteins("UAGUGG") should be(Seq())
  }

  test("Translation stops if STOP codon at end of two-codon sequence") {
    ProteinTranslation.proteins("UGGUAG") should be(Seq("Tryptophan"))
  }

  test("Translation stops if STOP codon at end of three-codon sequence") {
    ProteinTranslation.proteins("AUGUUUUAA") should be(
      Seq("Methionine", "Phenylalanine"))
  }

  test("Translation stops if STOP codon in middle of three-codon sequence") {
    ProteinTranslation.proteins("UGGUAGUGG") should be(Seq("Tryptophan"))
  }

  test("Translation stops if STOP codon in middle of six-codon sequence") {
    ProteinTranslation.proteins("UGGUGUUAUUAAUGGUUU") should be(
      Seq("Tryptophan", "Cysteine", "Tyrosine"))
  }
}
