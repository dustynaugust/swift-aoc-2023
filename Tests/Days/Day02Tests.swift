import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day02TestsTests: XCTestCase { }

// MARK: - Part 1 Test(s)
extension Day02TestsTests {
    func test_part1() throws {
        let challenge = Day02(data: part1_TestData)
        XCTAssertEqual(String(describing: challenge.part1()), "8")
    }
    
    // MARK: Part 1 Test Data
    private var part1_TestData: String {
        return """
        \(part1_TestData_Line1)
        \(part1_TestData_Line2)
        \(part1_TestData_Line3)
        \(part1_TestData_Line4)
        \(part1_TestData_Line5)
        """
    }
    
    private var part1_TestData_Line1: String { "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green" }
    private var part1_TestData_Line2: String { "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue" }
    private var part1_TestData_Line3: String { "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red" }
    private var part1_TestData_Line4: String { "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red" }
    private var part1_TestData_Line5: String { "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green" }
}

// MARK: - Part 2 Test(s)
extension Day02TestsTests {
    func test_part2() throws {
        XCTFail("TODO")
    }
    
    // MARK: Part 2 Test Data
    
    private var part2_TestData: String {
        return """
        """
    }
}
