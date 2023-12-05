import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day04Tests: XCTestCase { 
    private var testData: String {
        return """
        \(testData_Line1)
        \(testData_Line2)
        \(testData_Line3)
        \(testData_Line4)
        \(testData_Line5)
        \(testData_Line6)
        """
    }
    
    private var testData_Line1: String { "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53" }
    private var testData_Line2: String { "Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19" }
    private var testData_Line3: String { "Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1" }
    private var testData_Line4: String { "Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83" }
    private var testData_Line5: String { "Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36" }
    private var testData_Line6: String { "Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11" }
}

// MARK: - Part 1 Test(s)
extension Day04Tests {
    func test_part1() throws {
        let challenge = Day04(data: testData)
        XCTAssertEqual(String(describing: challenge.part1()), "13")
    }
    
    func test_part1_TestData_Line1() throws {
        let challenge = Day04(data: testData_Line1)
        XCTAssertEqual(String(describing: challenge.part1()), "8")
    }
    
    func test_part1_TestData_Line2() throws {
        let challenge = Day04(data: testData_Line2)
        XCTAssertEqual(String(describing: challenge.part1()), "2")
    }
    
    func test_part1_TestData_Line3() throws {
        let challenge = Day04(data: testData_Line3)
        XCTAssertEqual(String(describing: challenge.part1()), "2")
    }
    
    func test_part1_TestData_Line4() throws {
        let challenge = Day04(data: testData_Line4)
        XCTAssertEqual(String(describing: challenge.part1()), "1")
    }
    
    func test_part1_TestData_Line5() throws {
        let challenge = Day04(data: testData_Line5)
        XCTAssertEqual(String(describing: challenge.part1()), "0")
    }
    
    func test_part1_TestData_Line6() throws {
        let challenge = Day04(data: testData_Line6)
        XCTAssertEqual(String(describing: challenge.part1()), "0")
    }
}

// MARK: - Part 2 Test(s)
extension Day04Tests {
    func test_part2() throws {
        let challenge = Day04(data: testData)
        XCTAssertEqual(String(describing: challenge.part2()), "30")
    }
}
