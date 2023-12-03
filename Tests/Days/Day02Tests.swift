import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day02TestsTests: XCTestCase {
    // MARK: Test Data
    private var testData: String {
        return """
        \(testData_Line1)
        \(testData_Line2)
        \(testData_Line3)
        \(testData_Line4)
        \(testData_Line5)
        """
    }
    
    private var testData_Line1: String { "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green" }
    private var testData_Line2: String { "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue" }
    private var testData_Line3: String { "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red" }
    private var testData_Line4: String { "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red" }
    private var testData_Line5: String { "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green" }
}

// MARK: - Part 1 Test(s)
extension Day02TestsTests {
    func test_part1() throws {
        let challenge = Day02(data: testData)
        XCTAssertEqual(String(describing: challenge.part1()), "8")
    }
    
    func test_part1_TestData_Line1() throws {
        let challenge = Day02(data: testData_Line1)
        XCTAssertEqual(String(describing: challenge.part1()), "1")
    }
    
    func test_part1_TestData_Line2() throws {
        let challenge = Day02(data: testData_Line2)
        XCTAssertEqual(String(describing: challenge.part1()), "2")
    }
    
    func test_part1_TestData_Line3() throws {
        let challenge = Day02(data: testData_Line3)
        XCTAssertEqual(String(describing: challenge.part1()), "0")
    }
    
    func test_part1_TestData_Line4() throws {
        let challenge = Day02(data: testData_Line4)
        XCTAssertEqual(String(describing: challenge.part1()), "0")
    }
    
    func test_part1_TestData_Line5() throws {
        let challenge = Day02(data: testData_Line5)
        XCTAssertEqual(String(describing: challenge.part1()), "5")
    }
}

// MARK: - Part 2 Test(s)
extension Day02TestsTests {
    func test_part2() throws {
        let challenge = Day02(data: testData)
        XCTAssertEqual(String(describing: challenge.part2()), "2286")
    }
    
    func test_part2_TestData_Line1() throws {
        let challenge = Day02(data: testData_Line1)
        XCTAssertEqual(String(describing: challenge.part2()), "48")
    }
    
    func test_part2_TestData_Line2() throws {
        let challenge = Day02(data: testData_Line2)
        XCTAssertEqual(String(describing: challenge.part2()), "12")
    }
    
    func test_part2_TestData_Line3() throws {
        let challenge = Day02(data: testData_Line3)
        XCTAssertEqual(String(describing: challenge.part2()), "1560")
    }
    
    func test_part2_TestData_Line4() throws {
        let challenge = Day02(data: testData_Line4)
        XCTAssertEqual(String(describing: challenge.part2()), "630")
    }
    
    func test_part2_TestData_Line5() throws {
        let challenge = Day02(data: testData_Line5)
        XCTAssertEqual(String(describing: challenge.part2()), "36")
    }
}
