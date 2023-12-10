import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day09Tests: XCTestCase {
    private var sampleData: String {
        return """
        \(sampleData_line1)
        \(sampleData_line2)
        \(sampleData_line3)
        """
    }
    
    private var sampleData_line1: String { "0 3 6 9 12 15" }
    private var sampleData_line2: String { "1 3 6 10 15 21" }
    private var sampleData_line3: String { "10 13 16 21 30 45" }
}

// MARK: - Part 1 Test(s)
extension Day09Tests {
    func test_part1_sampleData() throws {
        let challenge = Day09(data: sampleData)
        XCTAssertEqual(String(describing: challenge.part1()), "114")
    }
    
    func test_part1_sampleData_line1() throws {
        let challenge = Day09(data: sampleData_line1)
        XCTAssertEqual(String(describing: challenge.part1()), "18")
    }
    
    func test_part1_sampleData_line2() throws {
        let challenge = Day09(data: sampleData_line2)
        XCTAssertEqual(String(describing: challenge.part1()), "28")
    }
    
    func test_part1_sampleData_line3() throws {
        let challenge = Day09(data: sampleData_line3)
        XCTAssertEqual(String(describing: challenge.part1()), "68")
    }
}

extension Day09Tests {
    func test_part2_sampleData() throws {
        let challenge = Day09(data: sampleData)
        XCTAssertEqual(String(describing: challenge.part2()), "2")
    }
    
    func test_part2_sampleData_line1() throws {
        let challenge = Day09(data: sampleData_line1)
        XCTAssertEqual(String(describing: challenge.part2()), "0")
    }
    
    func test_part2_sampleData_line2() throws {
        let challenge = Day09(data: sampleData_line2)
        XCTAssertEqual(String(describing: challenge.part2()), "-3")
    }
    
    func test_part2_sampleData_line3() throws {
        let challenge = Day09(data: sampleData_line3)
        XCTAssertEqual(String(describing: challenge.part2()), "5")
    }
}
