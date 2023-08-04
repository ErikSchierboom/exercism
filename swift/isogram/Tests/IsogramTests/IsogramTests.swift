import XCTest

@testable import Isogram

class IsogramTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptyString() {
    XCTAssertTrue(isIsogram(""))
  }

  func testIsogramWithOnlyLowerCaseCharacters() throws {
    XCTAssertTrue(isIsogram("isogram"))
  }

  func testWordWithOneDuplicatedCharacter() throws {
    XCTAssertFalse(isIsogram("eleven"))
  }

  func testWordWithOneDuplicatedCharacterFromTheEndOfTheAlphabet() throws {
    XCTAssertFalse(isIsogram("zzyzx"))
  }

  func testLongestReportedEnglishIsogram() throws {
    XCTAssertTrue(isIsogram("subdermatoglyphic"))
  }

  func testWordWithDuplicatedCharacterInMixedCase() throws {
    XCTAssertFalse(isIsogram("Alphabet"))
  }

  func testWordWithDuplicatedCharacterInMixedCaseLowercaseFirst() throws {
    XCTAssertFalse(isIsogram("alphAbet"))
  }

  func testHypotheticalIsogrammicWordWithHyphen() throws {
    XCTAssertTrue(isIsogram("thumbscrew-japingly"))
  }

  func testHypotheticalWordWithDuplicatedCharacterFollowingHyphen() throws {
    XCTAssertFalse(isIsogram("thumbscrew-jappingly"))
  }

  func testIsogramWithDuplicatedHyphen() throws {
    XCTAssertTrue(isIsogram("six-year-old"))
  }

  func testMadeUpNameThatIsAnIsogram() throws {
    XCTAssertTrue(isIsogram("Emily Jung Schwartzkopf"))
  }

  func testDuplicatedCharacterInTheMiddle() throws {
    XCTAssertFalse(isIsogram("accentor"))
  }

  func testSameFirstAndLastCharacters() throws {
    XCTAssertFalse(isIsogram("angola"))
  }

  func testWordWithDuplicatedCharacterAndWithTwoHyphens() throws {
    XCTAssertFalse(isIsogram("up-to-date"))
  }
}
