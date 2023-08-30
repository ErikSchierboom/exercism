import XCTest

@testable import ScrabbleScore

class ScrabbleScoreTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testLowercaseLetter() {
    XCTAssertEqual(score("a"), 1)
  }

  func testUppercaseLetter() throws {
    XCTAssertEqual(score("A"), 1)
  }

  func testValuableLetter() throws {
    XCTAssertEqual(score("f"), 4)
  }

  func testShortWord() throws {
    XCTAssertEqual(score("at"), 2)
  }

  func testShortValuableWord() throws {
    XCTAssertEqual(score("zoo"), 12)
  }

  func testMediumWord() throws {
    XCTAssertEqual(score("street"), 6)
  }

  func testMediumValuableWord() throws {
    XCTAssertEqual(score("quirky"), 22)
  }

  func testLongMixedCaseWord() throws {
    XCTAssertEqual(score("OxyphenButazone"), 41)
  }

  func testEnglishLikeWord() throws {
    XCTAssertEqual(score("pinata"), 8)
  }

  func testEmptyInput() throws {
    XCTAssertEqual(score(""), 0)
  }

  func testEntireAlphabetAvailable() throws {
    XCTAssertEqual(score("abcdefghijklmnopqrstuvwxyz"), 87)
  }
}
