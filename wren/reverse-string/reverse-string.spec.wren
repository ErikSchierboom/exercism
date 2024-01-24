import "wren-testie/testie" for Testie, Expect
import "./reverse-string" for StringUtil

Testie.test("Hello World") { |do, skip|
  do.test("empty string") {
    var expected = ""
    var actual = StringUtil.reverse("")
    Expect.value(actual).toEqual(expected)
  }

  do.test("a word") {
    var expected = "tobor"
    var actual = StringUtil.reverse("robot")
    Expect.value(actual).toEqual(expected)
  }

  do.test("a capitalized word") {
    var expected = "nemaR"
    var actual = StringUtil.reverse("Ramen")
    Expect.value(actual).toEqual(expected)
  }

  do.test("a sentence with punctuation") {
    var expected = "!yrgnuh ma I"
    var actual = StringUtil.reverse("I am hungry!")
    Expect.value(actual).toEqual(expected)
  }

  do.test("a palindrome") {
    var expected = "racecar"
    var actual = StringUtil.reverse("racecar")
    Expect.value(actual).toEqual(expected)
  }

  do.test("an even-sized word") {
    var expected = "reward"
    var actual = StringUtil.reverse("drawer")
    Expect.value(actual).toEqual(expected)
  }
}
