import XCTest

@testable import RnaTranscription

class RnaTranscriptionTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptyRnaSequence() {
    XCTAssertEqual(toRna(""), "")
  }

  func testRnaComplementOfCytosineIsGuanine() throws {
    XCTAssertEqual(toRna("C"), "G")
  }

  func testRnaComplementOfGuanineIsCytosine() throws {
    XCTAssertEqual(toRna("G"), "C")
  }

  func testRnaComplementOfThymineIsAdenine() throws {
    XCTAssertEqual(toRna("T"), "A")
  }

  func testRnaComplementOfAdenineIsUracil() throws {
    XCTAssertEqual(toRna("A"), "U")
  }

  func testRnaComplement() throws {
    XCTAssertEqual(toRna("ACGTGGTCTTAA"), "UGCACCAGAAUU")
  }
}
