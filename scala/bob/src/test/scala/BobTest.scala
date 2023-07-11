import org.scalatest.{Matchers, FunSuite}

/** @version 1.4.0 */
class BobTest extends FunSuite with Matchers {

  test("stating something") {
    Bob.response("Tom-ay-to, tom-aaaah-to.") should be("Whatever.")
  }

  test("shouting") {
    Bob.response("WATCH OUT!") should be("Whoa, chill out!")
  }

  test("shouting gibberish") {
    Bob.response("FCECDFCAAB") should be("Whoa, chill out!")
  }

  test("asking a question") {
    Bob.response("Does this cryogenic chamber make me look fat?") should be(
      "Sure.")
  }

  test("asking a numeric question") {
    Bob.response("You are, what, like 15?") should be("Sure.")
  }

  test("asking gibberish") {
    Bob.response("fffbbcbeab?") should be("Sure.")
  }

  test("talking forcefully") {
    Bob.response("Let's go make out behind the gym!") should be("Whatever.")
  }

  test("using acronyms in regular speech") {
    Bob.response("It's OK if you don't want to go to the DMV.") should be(
      "Whatever.")
  }

  test("forceful question") {
    Bob.response("WHAT THE HELL WERE YOU THINKING?") should be(
      "Calm down, I know what I'm doing!")
  }

  test("shouting numbers") {
    Bob.response("1, 2, 3 GO!") should be("Whoa, chill out!")
  }

  test("no letters") {
    Bob.response("1, 2, 3") should be("Whatever.")
  }

  test("question with no letters") {
    Bob.response("4?") should be("Sure.")
  }

  test("shouting with special characters") {
    Bob.response("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!") should be(
      "Whoa, chill out!")
  }

  test("shouting with no exclamation mark") {
    Bob.response("I HATE THE DMV") should be("Whoa, chill out!")
  }

  test("statement containing question mark") {
    Bob.response("Ending with ? means a question.") should be("Whatever.")
  }

  test("non-letters with question") {
    Bob.response(":) ?") should be("Sure.")
  }

  test("prattling on") {
    Bob.response("Wait! Hang on. Are you going to be OK?") should be("Sure.")
  }

  test("silence") {
    Bob.response("") should be("Fine. Be that way!")
  }

  test("prolonged silence") {
    Bob.response("          ") should be("Fine. Be that way!")
  }

  test("alternate silence") {
    Bob.response("										") should be("Fine. Be that way!")
  }

  test("multiple line question") {
    Bob.response("""
Does this cryogenic chamber make me look fat?
No.""") should be("Whatever.")
  }

  test("starting with whitespace") {
    Bob.response("         hmmmmmmm...") should be("Whatever.")
  }

  test("ending with whitespace") {
    Bob.response("Okay if like my  spacebar  quite a bit?   ") should be(
      "Sure.")
  }

  test("other whitespace") {
    Bob.response("""
                 	""") should be("Fine. Be that way!")
  }

  test("non-question ending with whitespace") {
    Bob.response("This is a statement ending with whitespace      ") should be(
      "Whatever.")
  }
}
