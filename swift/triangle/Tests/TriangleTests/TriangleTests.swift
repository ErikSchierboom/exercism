import XCTest

@testable import Triangle

class TriangleTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testAllSidesAreEqual1() {
    XCTAssertTrue(Triangle([2, 2, 2]).isEquilateral)
  }

  func testAnySideIsUnequal1() throws {
    XCTAssertFalse(Triangle([2, 3, 2]).isEquilateral)
  }

  func testNoSidesAreEqual1() throws {
    XCTAssertFalse(Triangle([5, 4, 6]).isEquilateral)
  }

  func testAllZeroSidesIsNotATriangle1() throws {
    XCTAssertFalse(Triangle([0, 0, 0]).isEquilateral)
  }

  func testSidesMayBeFloats1() throws {
    XCTAssertTrue(Triangle([0.5, 0.5, 0.5]).isEquilateral)
  }

  func testLastTwoSidesAreEqual2() throws {
    XCTAssertTrue(Triangle([3, 4, 4]).isIsosceles)
  }

  func testFirstTwoSidesAreEqual2() throws {
    XCTAssertTrue(Triangle([4, 4, 3]).isIsosceles)
  }

  func testFirstAndLastSidesAreEqual2() throws {
    XCTAssertTrue(Triangle([4, 3, 4]).isIsosceles)
  }

  func testEquilateralTrianglesAreAlsoIsosceles2() throws {
    XCTAssertTrue(Triangle([4, 4, 4]).isIsosceles)
  }

  func testNoSidesAreEqual2() throws {
    XCTAssertFalse(Triangle([2, 3, 4]).isIsosceles)
  }

  func testFirstTriangleInequalityViolation2() throws {
    XCTAssertFalse(Triangle([1, 1, 3]).isIsosceles)
  }

  func testSecondTriangleInequalityViolation2() throws {
    XCTAssertFalse(Triangle([1, 3, 1]).isIsosceles)
  }

  func testThirdTriangleInequalityViolation2() throws {
    XCTAssertFalse(Triangle([3, 1, 1]).isIsosceles)
  }

  func testSidesMayBeFloats2() throws {
    XCTAssertTrue(Triangle([0.5, 0.4, 0.5]).isIsosceles)
  }

  func testNoSidesAreEqual3() throws {
    XCTAssertTrue(Triangle([5, 4, 6]).isScalene)
  }

  func testAllSidesAreEqual3() throws {
    XCTAssertFalse(Triangle([4, 4, 4]).isScalene)
  }

  func testFirstAndSecondSidesAreEqual3() throws {
    XCTAssertFalse(Triangle([4, 4, 3]).isScalene)
  }

  func testFirstAndThirdSidesAreEqual3() throws {
    XCTAssertFalse(Triangle([3, 4, 3]).isScalene)
  }

  func testSecondAndThirdSidesAreEqual3() throws {
    XCTAssertFalse(Triangle([4, 3, 3]).isScalene)
  }

  func testMayNotViolateTriangleInequality3() throws {
    XCTAssertFalse(Triangle([7, 3, 2]).isScalene)
  }

  func testSidesMayBeFloats3() throws {
    XCTAssertTrue(Triangle([0.5, 0.4, 0.6]).isScalene)
  }
}
