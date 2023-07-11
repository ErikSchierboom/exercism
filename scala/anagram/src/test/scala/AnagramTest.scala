import org.scalatest.{Matchers, FunSuite}

/** @version 1.4.0 */
class AnagramTest extends FunSuite with Matchers {

  test("no matches") {
    Anagram.findAnagrams("diaper", List("hello", "world", "zombies", "pants")) should be(
      List())
  }

  test("detects two anagrams") {
    Anagram.findAnagrams("master", List("stream", "pigeon", "maters")) should be(
      List("stream", "maters"))
  }

  test("does not detect anagram subsets") {
    Anagram.findAnagrams("good", List("dog", "goody")) should be(List())
  }

  test("detects anagram") {
    Anagram.findAnagrams(
      "listen",
      List("enlists", "google", "inlets", "banana")) should be(List("inlets"))
  }

  test("detects three anagrams") {
    Anagram.findAnagrams("allergy",
                         List("gallery",
                              "ballerina",
                              "regally",
                              "clergy",
                              "largely",
                              "leading")) should be(
      List("gallery", "regally", "largely"))
  }

  test("does not detect non-anagrams with identical checksum") {
    Anagram.findAnagrams("mass", List("last")) should be(List())
  }

  test("detects anagrams case-insensitively") {
    Anagram.findAnagrams(
      "Orchestra",
      List("cashregister", "Carthorse", "radishes")) should be(
      List("Carthorse"))
  }

  test("detects anagrams using case-insensitive subject") {
    Anagram.findAnagrams(
      "Orchestra",
      List("cashregister", "carthorse", "radishes")) should be(
      List("carthorse"))
  }

  test("detects anagrams using case-insensitive possible matches") {
    Anagram.findAnagrams(
      "orchestra",
      List("cashregister", "Carthorse", "radishes")) should be(
      List("Carthorse"))
  }

  test("does not detect a anagram if the original word is repeated") {
    Anagram.findAnagrams("go", List("go Go GO")) should be(List())
  }

  test("anagrams must use all letters exactly once") {
    Anagram.findAnagrams("tapper", List("patter")) should be(List())
  }

  test("words are not anagrams of themselves (case-insensitive)") {
    Anagram.findAnagrams("BANANA", List("BANANA", "Banana", "banana")) should be(
      List())
  }
}
