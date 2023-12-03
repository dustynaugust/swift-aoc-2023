import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day01Tests: XCTestCase {
    func testPart1() throws {
        let challenge = Day01(data: testData)
        XCTAssertEqual(String(describing: challenge.part1()), "142")
    }
    
    func testPart2() throws {
        XCTFail("TODO")
    }
}

private extension Day01Tests {
    // Smoke test data provided in the challenge question
    private var testData: String {
        return """
      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
      """
    }
}
