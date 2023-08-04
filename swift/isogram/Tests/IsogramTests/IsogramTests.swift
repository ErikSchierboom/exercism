import XCTest

@testable import Isogram

class IsogramTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptyString() {
    XCTAssertTrue(Isogram.isIsogram(""))
  }

  func testIsogramWithOnlyLowerCaseCharacters() throws {
    XCTAssertTrue(Isogram.isIsogram("isogram"))
  }

  func testWordWithOneDuplicatedCharacter() throws {
    XCTAssertFalse(Isogram.isIsogram("eleven"))
  }

  func testWordWithOneDuplicatedCharacterFromTheEndOfTheAlphabet() throws {
    XCTAssertFalse(Isogram.isIsogram("zzyzx"))
  }

  func testLongestReportedEnglishIsogram() throws {
    XCTAssertTrue(Isogram.isIsogram("subdermatoglyphic"))
  }

  func testWordWithDuplicatedCharacterInMixedCase() throws {
    XCTAssertFalse(Isogram.isIsogram("Alphabet"))
  }

  func testWordWithDuplicatedCharacterInMixedCaseLowercaseFirst() throws {
    XCTAssertFalse(Isogram.isIsogram("alphAbet"))
  }

  func testHypotheticalIsogrammicWordWithHyphen() throws {
    XCTAssertTrue(Isogram.isIsogram("thumbscrew-japingly"))
  }

  func testHypotheticalWordWithDuplicatedCharacterFollowingHyphen() throws {
    XCTAssertFalse(Isogram.isIsogram("thumbscrew-jappingly"))
  }

  func testIsogramWithDuplicatedHyphen() throws {
    XCTAssertTrue(Isogram.isIsogram("six-year-old"))
  }

  func testMadeUpNameThatIsAnIsogram() throws {
    XCTAssertTrue(Isogram.isIsogram("Emily Jung Schwartzkopf"))
  }

  func testDuplicatedCharacterInTheMiddle() throws {
    XCTAssertFalse(Isogram.isIsogram("accentor"))
  }

  func testSameFirstAndLastCharacters() throws {
    XCTAssertFalse(Isogram.isIsogram("angola"))
  }

  func testWordWithDuplicatedCharacterAndWithTwoHyphens() throws {
    XCTAssertFalse(Isogram.isIsogram("up-to-date"))
  }
}
