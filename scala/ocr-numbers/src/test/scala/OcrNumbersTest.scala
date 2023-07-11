import org.scalatest.{Matchers, FunSuite}

/** @version 1.1.0 */
class OcrNumbersTest extends FunSuite with Matchers {

  test("Recognizes 0") {
    OcrNumbers.convert(List(" _ ",
                            "| |",
                            "|_|",
                            "   ")) should be("0")
  }

  test("Recognizes 1") {
    OcrNumbers.convert(List("   ",
                            "  |",
                            "  |",
                            "   ")) should be("1")
  }

  test("Unreadable but correctly sized inputs return ?") {
    OcrNumbers.convert(List("   ",
                            "  _",
                            "  |",
                            "   ")) should be("?")
  }

  test(
    "Input with a number of lines that is not a multiple of four raises an error") {
    OcrNumbers.convert(List(" _ ",
                            "| |",
                            "   ")) should be("?")
  }

  test(
    "Input with a number of columns that is not a multiple of three raises an error") {
    OcrNumbers.convert(List("    ",
                            "   |",
                            "   |",
                            "    ")) should be("?")
  }

  test("Recognizes 110101100") {
    OcrNumbers.convert(
      List("       _     _        _  _ ",
           "  |  || |  || |  |  || || |",
           "  |  ||_|  ||_|  |  ||_||_|",
           "                           ")) should be("110101100")
  }

  test("Garbled numbers in a string are replaced with ?") {
    OcrNumbers.convert(
      List("       _     _           _ ",
           "  |  || |  || |     || || |",
           "  |  | _|  ||_|  |  ||_||_|",
           "                           ")) should be("11?10?1?0")
  }

  test("Recognizes 2") {
    OcrNumbers.convert(List(" _ ",
                            " _|",
                            "|_ ",
                            "   ")) should be("2")
  }

  test("Recognizes 3") {
    OcrNumbers.convert(List(" _ ",
                            " _|",
                            " _|",
                            "   ")) should be("3")
  }

  test("Recognizes 4") {
    OcrNumbers.convert(List("   ",
                            "|_|",
                            "  |",
                            "   ")) should be("4")
  }

  test("Recognizes 5") {
    OcrNumbers.convert(List(" _ ",
                            "|_ ",
                            " _|",
                            "   ")) should be("5")
  }

  test("Recognizes 6") {
    OcrNumbers.convert(List(" _ ",
                            "|_ ",
                            "|_|",
                            "   ")) should be("6")
  }

  test("Recognizes 7") {
    OcrNumbers.convert(List(" _ ",
                            "  |",
                            "  |",
                            "   ")) should be("7")
  }

  test("Recognizes 8") {
    OcrNumbers.convert(List(" _ ",
                            "|_|",
                            "|_|",
                            "   ")) should be("8")
  }

  test("Recognizes 9") {
    OcrNumbers.convert(List(" _ ",
                            "|_|",
                            " _|",
                            "   ")) should be("9")
  }

  test("Recognizes string of decimal numbers") {
    OcrNumbers.convert(
      List("    _  _     _  _  _  _  _  _ ",
           "  | _| _||_||_ |_   ||_||_|| |",
           "  ||_  _|  | _||_|  ||_| _||_|",
           "                              ")) should be("1234567890")
  }

  test(
    "Numbers separated by empty lines are recognized. Lines are joined by commas.") {
    OcrNumbers.convert(
      List("    _  _ ",
           "  | _| _|",
           "  ||_  _|",
           "         ",
           "    _  _ ",
           "|_||_ |_ ",
           "  | _||_|",
           "         ",
           " _  _  _ ",
           "  ||_||_|",
           "  ||_| _|",
           "         ")) should be("123,456,789")
  }
}
