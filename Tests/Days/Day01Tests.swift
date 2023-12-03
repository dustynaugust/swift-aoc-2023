import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day01Tests: XCTestCase { }

// MARK: - Part 1 Test(s)
extension Day01Tests {
    func test_part1() throws {
        let challenge = Day01(data: part1_TestData)
        XCTAssertEqual(String(describing: challenge.part1()), "142")
    }
    
    func test_part1_TestData_Line1() throws {
        let challenge = Day01(data: part1_TestData_Line1)
        XCTAssertEqual(String(describing: challenge.part1()), "12")
    }
    
    func test_part1_TestData_Line2() throws {
        let challenge = Day01(data: part1_TestData_Line2)
        XCTAssertEqual(String(describing: challenge.part1()), "38")
    }
    
    func test_part1_TestData_Line3() throws {
        let challenge = Day01(data: part1_TestData_Line3)
        XCTAssertEqual(String(describing: challenge.part1()), "15")
    }
    
    func test_part1_TestData_Line4() throws {
        let challenge = Day01(data: part1_TestData_Line4)
        XCTAssertEqual(String(describing: challenge.part1()), "77")
    }
    
    // MARK: Part 1 Test Data
    private var part1_TestData: String {
        return """
        \(part1_TestData_Line1)
        \(part1_TestData_Line2)
        \(part1_TestData_Line3)
        \(part1_TestData_Line4)
        """
    }
    
    private var part1_TestData_Line1: String { "1abc2" }
    private var part1_TestData_Line2: String { "pqr3stu8vwx" }
    private var part1_TestData_Line3: String { "a1b2c3d4e5f" }
    private var part1_TestData_Line4: String { "treb7uchet" }
}

// MARK: - Part 2 Test(s)
extension Day01Tests {
    func test_part2() throws {
        let challenge = Day01(data: part2_TestData)
        XCTAssertEqual(String(describing: challenge.part2()), "281")
    }
    
    func test_part2_TestData_Line1() throws {
        let challenge = Day01(data: part2_TestData_Line1)
        XCTAssertEqual(String(describing: challenge.part2()), "29")
    }
    
    func test_part2_TestData_Line2() throws {
        let challenge = Day01(data: part2_TestData_Line2)
        XCTAssertEqual(String(describing: challenge.part2()), "83")
    }
    
    func test_part2_TestData_Line3() throws {
        let challenge = Day01(data: part2_TestData_Line3)
        XCTAssertEqual(String(describing: challenge.part2()), "13")
    }
    
    func test_part2_TestData_Line4() throws {
        let challenge = Day01(data: part2_TestData_Line4)
        XCTAssertEqual(String(describing: challenge.part2()), "24")
    }
    
    func test_part2_TestData_Line5() throws {
        let challenge = Day01(data: part2_TestData_Line5)
        XCTAssertEqual(String(describing: challenge.part2()), "42")
    }
    
    func test_part2_TestData_Line6() throws {
        let challenge = Day01(data: part2_TestData_Line6)
        XCTAssertEqual(String(describing: challenge.part2()), "14")
    }
    
    func test_part2_TestData_Line7() throws {
        let challenge = Day01(data: part2_TestData_Line7)
        XCTAssertEqual(String(describing: challenge.part2()), "76")
    }
    
    
    func test_part2_TestData_OverlappingSpelledOutDigit() throws {
        let challenge = Day01(data: "twone")
        XCTAssertEqual(String(describing: challenge.part2()), "21")
    }
    
    
    func test_part2_TestData_AdHoc() throws {
        let challenge = Day01(data: "twonine")
        XCTAssertEqual(String(describing: challenge.part2()), "29")
    }
    
    
    // MARK: Part 2 Test Data
    
    private var part2_TestData: String {
        return """
        \(part2_TestData_Line1)
        \(part2_TestData_Line2)
        \(part2_TestData_Line3)
        \(part2_TestData_Line4)
        \(part2_TestData_Line5)
        \(part2_TestData_Line6)
        \(part2_TestData_Line7)
        """
    }
    
    private var part2_TestData_Line1: String { "two1nine" }
    private var part2_TestData_Line2: String { "eightwothree" }
    private var part2_TestData_Line3: String { "abcone2threexyz" }
    private var part2_TestData_Line4: String { "xtwone3four" }
    private var part2_TestData_Line5: String { "4nineeightseven2" }
    private var part2_TestData_Line6: String { "zoneight234" }
    private var part2_TestData_Line7: String { "7pqrstsixteen" }
}
