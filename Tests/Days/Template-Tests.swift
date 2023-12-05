import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class TemplateTests: XCTestCase {
    private var testData: String {
        return """
        """
    }
}

// MARK: - Part 1 Test(s)
extension TemplateTests {
    func test_part1() throws {
        let challenge = Template(data: testData)
        XCTAssertEqual(String(describing: challenge.part1()), "TODO")
    }
    
    
}

// MARK: - Part 2 Test(s)
extension TemplateTests {
    func test_part2() throws {
        let challenge = Template(data: testData)
        XCTAssertEqual(String(describing: challenge.part2()), "TODO")
    }
}
