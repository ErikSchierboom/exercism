import org.scalatest.{FunSuite, Matchers}

class IsogramTest extends FunSuite with Matchers {

  test("empty string") {
    val result = Isogram.isIsogram("")
    result should be (true)
  }

  test("isogram with only lower case characters") {
    
    val result = Isogram.isIsogram("isogram")
    result should be (true)
  }

  test("word with one duplicated character") {
    
    val result = Isogram.isIsogram("eleven")
    result should be (false)
  }

  test("longest reported english isogram") {
    
    val result = Isogram.isIsogram("subdermatoglyphic")
    result should be (true)
  }

  test("word with duplicated character in mixed case") {
    
    val result = Isogram.isIsogram("Alphabet")
    result should be (false)
  }

  test("hypothetical isogrammic word with hyphen") {
    
    val result = Isogram.isIsogram("thumbscrew-japingly")
    result should be (true)
  }

  test("isogram with duplicated non letter character") {
    
    val result = Isogram.isIsogram("Hjelmqvist-Gryb-Zock-Pfund-Wax")
    result should be (true)
  }

  test("made-up name that is an isogram") {
    
    val result = Isogram.isIsogram("Emily Jung Schwartzkopf")
    result should be (true)
  }

}
