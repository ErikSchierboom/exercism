import XCTest

@testable import DifferenceOfSquares

class DifferenceOfSquaresTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testSquareOfSum1() {
    XCTAssertEqual(1, Squares(1).squareOfSum)
  }

  func testSquareOfSum5() throws {
    XCTAssertEqual(225, Squares(5).squareOfSum)
  }

  func testSquareOfSum100() throws {
    XCTAssertEqual(25_502_500, Squares(100).squareOfSum)
  }

  func testSumOfSquares1() throws {
    XCTAssertEqual(1, Squares(1).sumOfSquares)
  }

  func testSumOfSquares5() throws {
    XCTAssertEqual(55, Squares(5).sumOfSquares)
  }

  func testSumOfSquares100() throws {
    XCTAssertEqual(338350, Squares(100).sumOfSquares)
  }

  func testDifferenceOfSquares1() throws {
    XCTAssertEqual(0, Squares(1).differenceOfSquares)
  }

  func testDifferenceOfSquares5() throws {
    XCTAssertEqual(170, Squares(5).differenceOfSquares)
  }

  func testDifferenceOfSquares100() throws {
    XCTAssertEqual(25_164_150, Squares(100).differenceOfSquares)
  }
}
