import org.scalatest.funsuite.AnyFunSuite
import org.scalatest.matchers.should.Matchers


class ReverseStringTest extends AnyFunSuite with Matchers {
  
  test("an empty string") {
    ReverseString.reverse("") should be ("")
  }

  test("a word") {
    ReverseString.reverse("robot") should be ("tobor")
  }

  test("a capitalized word") {
    ReverseString.reverse("Ramen") should be ("nemaR")
  }

  test("a sentence with punctuation") {
    ReverseString.reverse("I'm hungry!") should be ("!yrgnuh m'I")
  }

  test("a palindrome") {
    ReverseString.reverse("racecar") should be ("racecar")
  }

  test("an even-sized word") {
    ReverseString.reverse("drawer") should be ("reward")
  }
}
