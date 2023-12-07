import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day07Tests: XCTestCase {
    private var sampleData: String {
        return """
        32T3K 765
        T55J5 684
        KK677 28
        KTJJT 220
        QQQJA 483
        """
    }
}

// MARK: - Part 1 Test(s)
extension Day07Tests {
    func test_part1() throws {
        let challenge = Day07(data: sampleData)
        XCTAssertEqual(String(describing: challenge.part1()), "6440")
    }    
}

// MARK: - Part 2 Test(s)
extension Day07Tests {
    func test_part2() throws {
        let challenge = Day07(data: sampleData)
        XCTAssertEqual(String(describing: challenge.part2()), "TODO")
    }
}
