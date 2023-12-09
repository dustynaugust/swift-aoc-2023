import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day08Tests: XCTestCase {
    private var sampleData1: String {
        return """
        RL

        AAA = (BBB, CCC)
        BBB = (DDD, EEE)
        CCC = (ZZZ, GGG)
        DDD = (DDD, DDD)
        EEE = (EEE, EEE)
        GGG = (GGG, GGG)
        ZZZ = (ZZZ, ZZZ)
        """
    }
    
    private var sampleData2: String {
        return """
        LLR

        AAA = (BBB, BBB)
        BBB = (AAA, ZZZ)
        ZZZ = (ZZZ, ZZZ
        """
    }
    
    private var sampleData3: String {
        return """
        LR

        11A = (11B, XXX)
        11B = (XXX, 11Z)
        11Z = (11B, XXX)
        22A = (22B, XXX)
        22B = (22C, 22C)
        22C = (22Z, 22Z)
        22Z = (22B, 22B)
        XXX = (XXX, XXX)
        """
    }
}

// MARK: - Part 1 Test(s)
extension Day08Tests {
    func test_part1_WithSampleData1() async throws {
        let challenge = Day08(data: sampleData1)
        XCTAssertEqual(String(describing: challenge.part1()), "2")
    }
    
    func test_part1_WithSampleData2() throws {
        let challenge = Day08(data: sampleData2)
        XCTAssertEqual(String(describing: challenge.part1()), "6")
    }
}

// MARK: - Part 2 Test(s)
extension Day08Tests {
    func test_part2() throws {
        let challenge = Day08(data: sampleData3)
        XCTAssertEqual(String(describing: challenge.part2()), "6")
    }
}
