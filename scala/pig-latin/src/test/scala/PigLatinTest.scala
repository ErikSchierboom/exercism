import org.scalatest.{Matchers, FunSuite}

/** @version 1.2.0 */
class PigLatinTest extends FunSuite with Matchers {

  test("word beginning with a") {
    PigLatin.translate("apple") should be("appleay")
  }

  test("word beginning with e") {
    PigLatin.translate("ear") should be("earay")
  }

  test("word beginning with i") {
    PigLatin.translate("igloo") should be("iglooay")
  }

  test("word beginning with o") {
    PigLatin.translate("object") should be("objectay")
  }

  test("word beginning with u") {
    PigLatin.translate("under") should be("underay")
  }

  test("word beginning with a vowel and followed by a qu") {
    PigLatin.translate("equal") should be("equalay")
  }

  test("word beginning with p") {
    PigLatin.translate("pig") should be("igpay")
  }

  test("word beginning with k") {
    PigLatin.translate("koala") should be("oalakay")
  }

  test("word beginning with x") {
    PigLatin.translate("xenon") should be("enonxay")
  }

  test("word beginning with q without a following u") {
    PigLatin.translate("qat") should be("atqay")
  }

  test("word beginning with ch") {
    PigLatin.translate("chair") should be("airchay")
  }

  test("word beginning with qu") {
    PigLatin.translate("queen") should be("eenquay")
  }

  test("word beginning with qu and a preceding consonant") {
    PigLatin.translate("square") should be("aresquay")
  }

  test("word beginning with th") {
    PigLatin.translate("therapy") should be("erapythay")
  }

  test("word beginning with thr") {
    PigLatin.translate("thrush") should be("ushthray")
  }

  test("word beginning with sch") {
    PigLatin.translate("school") should be("oolschay")
  }

  test("word beginning with yt") {
    PigLatin.translate("yttria") should be("yttriaay")
  }

  test("word beginning with xr") {
    PigLatin.translate("xray") should be("xrayay")
  }

  test("y is treated like a consonant at the beginning of a word") {
    PigLatin.translate("yellow") should be("ellowyay")
  }

  test("y is treated like a vowel at the end of a consonant cluster") {
    PigLatin.translate("rhythm") should be("ythmrhay")
  }

  test("y as second letter in two letter word") {
    PigLatin.translate("my") should be("ymay")
  }

  test("a whole phrase") {
    PigLatin.translate("quick fast run") should be("ickquay astfay unray")
  }
}
