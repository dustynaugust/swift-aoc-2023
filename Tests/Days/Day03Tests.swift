import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day03Tests: XCTestCase { 
    // MARK: Part Test Data
    private var testData: String {
        return """
        \(testData_Line1)
        \(testData_Line2)
        \(testData_Line3)
        \(testData_Line4)
        \(testData_Line5)
        \(testData_Line6)
        \(testData_Line7)
        \(testData_Line8)
        \(testData_Line9)
        \(testData_Line10)
        """
    }
    
    private var testData_Line1: String { "467..114.." }
    private var testData_Line2: String { "...*......" }
    private var testData_Line3: String { "..35..633." }
    private var testData_Line4: String { "......#..." }
    private var testData_Line5: String { "617*......" }
    private var testData_Line6: String { ".....+.58." }
    private var testData_Line7: String { "..592....." }
    private var testData_Line8: String { "......755." }
    private var testData_Line9: String { "...$.*...." }
    private var testData_Line10: String { ".664.598.." }
}

// MARK: - Part 1 Test(s)
extension Day03Tests {
    func test_part1() throws {
        let challenge = Day03(data: testData)
        XCTAssertEqual(String(describing: challenge.part1()), "4361")
    }
    
    func test_part1_AdHoc1() throws {
        let data = """
        .467.
        ....*
        """
        let challenge = Day03(data: data)
        XCTAssertEqual(String(describing: challenge.part1()), "467")
    }
    
    func test_part1_Line6_Line7() throws {
        let data = """
        \(testData_Line6)
        \(testData_Line7)
        """
        let challenge = Day03(data: data)
        XCTAssertEqual(String(describing: challenge.part1()), "592")
    }
}

// MARK: - Part 2 Test(s)
extension Day03Tests {
    func test_part2() throws {
        let challenge = Day03(data: testData)
        XCTAssertEqual(String(describing: challenge.part2()), "467835")
    }
}

