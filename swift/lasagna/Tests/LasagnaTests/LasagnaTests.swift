import XCTest
@testable import Lasagna

final class LasagnaTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testExpectedMinutes() {
    XCTAssertEqual(expectedMinutesInOven, 40)
  }

  func testRemainingMinutes() throws {
    XCTAssertEqual(remainingMinutesInOven(elapsedMinutes: 13), 27)
  }

  func testPreperationMinutes() throws {
    XCTAssertEqual(preparationTimeInMinutes(layers: 6), 12)
  }

  func testTotalMinutes() throws {
    XCTAssertEqual(totalTimeInMinutes(layers: 6, elapsedMinutes: 13), 25)
  }

  static var allTests = [
    ("testExpectedMinutes", testExpectedMinutes),
    ("testRemainingMinutes", testRemainingMinutes),
    ("testPreperationMinutes", testPreperationMinutes),
    ("testTotalMinutes", testTotalMinutes),
  ]
}
