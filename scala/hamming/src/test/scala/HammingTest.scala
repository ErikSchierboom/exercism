import org.scalatest.{Matchers, FunSuite}

/** @version 2.1.0 */
class HammingTest extends FunSuite with Matchers {
  
  test("empty strands") {
    Hamming.distance("", "") should be (Some(0))
  }

  test("identical strands") {
    Hamming.distance("A", "A") should be (Some(0))
  }

  test("long identical strands") {
    Hamming.distance("GGACTGA", "GGACTGA") should be (Some(0))
  }

  test("complete distance in single nucleotide strands") {
    Hamming.distance("A", "G") should be (Some(1))
  }

  test("complete distance in small strands") {
    Hamming.distance("AG", "CT") should be (Some(2))
  }

  test("small distance in small strands") {
    Hamming.distance("AT", "CT") should be (Some(1))
  }

  test("small distance") {
    Hamming.distance("GGACG", "GGTCG") should be (Some(1))
  }

  test("small distance in long strands") {
    Hamming.distance("ACCAGGG", "ACTATGG") should be (Some(2))
  }

  test("non-unique character in first strand") {
    Hamming.distance("AAG", "AAA") should be (Some(1))
  }

  test("non-unique character in second strand") {
    Hamming.distance("AAA", "AAG") should be (Some(1))
  }

  test("same nucleotides in different positions") {
    Hamming.distance("TAG", "GAT") should be (Some(2))
  }

  test("large distance") {
    Hamming.distance("GATACA", "GCATAA") should be (Some(4))
  }

  test("large distance in off-by-one strand") {
    Hamming.distance("GGACGGATTCTG", "AGGACGGATTCT") should be (Some(9))
  }

  test("disallow first strand longer") {
    Hamming.distance("AATG", "AAA") should be (None)
  }

  test("disallow second strand longer") {
    Hamming.distance("ATA", "AGTG") should be (None)
  }
}
