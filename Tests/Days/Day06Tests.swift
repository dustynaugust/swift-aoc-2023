import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day06Tests: XCTestCase {

    private var sampleData: String {
        return """
        Time:      7  15   30
        Distance:  9  40  200
        """
    }
    
    private var inputData: String {
        return """
        Time:        46     80     78     66
        Distance:   214   1177   1402   1024
        """
    }
}

// MARK: - Part 1 Test(s)
extension Day06Tests {
    func test_part1_sampleData() throws {
        let challenge = Day06(data: sampleData)
        XCTAssertEqual(String(describing: challenge.part1()), "288")
    }
    
    func test_part1_inputData() throws {
        let challenge = Day06(data: inputData)
        XCTAssertEqual(String(describing: challenge.part1()), "512295")
    }
}

// MARK: - Part 2 Test(s)
extension Day06Tests {
    func test_part2_sampleData() throws {
        let challenge = Day06(data: sampleData)
        XCTAssertEqual(String(describing: challenge.part2()), "71503")
    }
    
    func test_part2_inputData() throws {
        let challenge = Day06(data: inputData)
        XCTAssertEqual(String(describing: challenge.part2()), "36530883")
    }
}
