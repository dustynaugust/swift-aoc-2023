import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day06Tests: XCTestCase {
    private var testData: String {
        return """
        """
    }
}

// MARK: - Part 1 Test(s)
extension Day06Tests {
    func test_part1() throws {
        let challenge = Day06(data: testData)
        XCTAssertEqual(String(describing: challenge.part1()), "TODO")
    }
}

// MARK: - Part 2 Test(s)
extension Day06Tests {
    func test_part2() throws {
        let challenge = Day06(data: testData)
        XCTAssertEqual(String(describing: challenge.part2()), "TODO")
    }
}
