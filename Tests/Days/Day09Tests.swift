import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day09Tests: XCTestCase {
    private var sampleData: String {
        return """
        """
    }
}

// MARK: - Part 1 Test(s)
extension Day09Tests {
    func test_part1() throws {
        XCTExpectFailure("Not yet implemented part 1")
        let challenge = Day09(data: sampleData)
        XCTAssertEqual(String(describing: challenge.part1()), "TODO")
    }    
}

// MARK: - Part 2 Test(s)
extension Day09Tests {
    func test_part2() throws {
        XCTExpectFailure("Not yet implemented part 2")
        let challenge = Day09(data: sampleData)
        XCTAssertEqual(String(describing: challenge.part2()), "TODO")
    }
}
