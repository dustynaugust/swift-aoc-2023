import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day03Tests: XCTestCase { }

// MARK: - Part 1 Test(s)
extension Day03Tests {
    func test_part1() throws {
        let challenge = Day03(data: part1_TestData)
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
        \(part1_TestData_Line6)
        \(part1_TestData_Line7)
        """
        let challenge = Day03(data: data)
        XCTAssertEqual(String(describing: challenge.part1()), "592")
    }
    
    // MARK: Part 1 Test Data
    private var part1_TestData: String {
        return """
        \(part1_TestData_Line1)
        \(part1_TestData_Line2)
        \(part1_TestData_Line3)
        \(part1_TestData_Line4)
        \(part1_TestData_Line5)
        \(part1_TestData_Line6)
        \(part1_TestData_Line7)
        \(part1_TestData_Line8)
        \(part1_TestData_Line9)
        \(part1_TestData_Line10)
        """
    }
    
    private var part1_TestData_Line1: String { "467..114.." }
    private var part1_TestData_Line2: String { "...*......" }
    private var part1_TestData_Line3: String { "..35..633." }
    private var part1_TestData_Line4: String { "......#..." }
    private var part1_TestData_Line5: String { "617*......" }
    private var part1_TestData_Line6: String { ".....+.58." }
    private var part1_TestData_Line7: String { "..592....." }
    private var part1_TestData_Line8: String { "......755." }
    private var part1_TestData_Line9: String { "...$.*...." }
    private var part1_TestData_Line10: String { ".664.598.." }
    
}

// MARK: - Part 2 Test(s)
extension Day03Tests {
    func test_part2() throws {
        // TODO: Add Test for Part 2
        
    }
    
    // MARK: Part 2 Test Data
    
    private var part2_TestData: String {
        return """
        """
    }
}

