import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day07Tests: XCTestCase {
    private var sampleData: String {
        return """
        \(sampleData_line1)
        \(sampleData_line2)
        \(sampleData_line3)
        \(sampleData_line4)
        \(sampleData_line5)
        """
    }
    
    private var sampleData_line1: String { "32T3K 765" }
    private var sampleData_line2: String { "T55J5 684" }
    private var sampleData_line3: String { "KK677 28" }
    private var sampleData_line4: String { "KTJJT 220" }
    private var sampleData_line5: String { "QQQJA 483" }
    
    private func assert(
        _ string: String,
        withWildcard: Bool,
        isType expectedType: HandType,
        withCards expectedCards: [Card],
        bid expectedBid: Int,
        rank expectedRank: Hand.Rank,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let actualHand = Hand(input: string, withWildcard: withWildcard)
        
        XCTAssertEqual(
            actualHand.type,
            expectedType,
            "Expecting type of \(expectedType) got \(actualHand.type) instead.",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            actualHand.cards,
            expectedCards,
            "Expecting cards \(expectedCards) got \(actualHand.cards) instead.",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            actualHand.bid,
            expectedBid,
            "Expecting bid of \(expectedBid) got \(actualHand.bid) instead.",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            actualHand.rank.typeRank,
            expectedRank.typeRank,
            "Expecting type rank of \(expectedRank.typeRank) got \(actualHand.rank.typeRank) instead.",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            actualHand.rank.cardRanks,
            expectedRank.cardRanks,
            "Expecting card ranks of \(expectedRank.cardRanks) got \(actualHand.rank.cardRanks) instead.",
            file: file,
            line: line
        )
    }
    
    private func assert(
        _ string: String,
        withWildcard: Bool,
        isHandType expectedHandType: HandType,
        rank expectedRank: Int,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let actualHandType = HandType(for: string, withWildcard: withWildcard)
        XCTAssertEqual(
            actualHandType,
            expectedHandType,
            "Expecting hand of type \(expectedHandType) got \(actualHandType) instead.",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            actualHandType.rank,
            expectedRank,
            "Expecting hand type of rank \(expectedRank) got \(actualHandType.rank) instead.",
            file: file,
            line: line
        )
    }
    
    private func assert(
        _ char: Character,
        withWildcard: Bool,
        isCard expectedCard: Card,
        rank expectedRank: Int,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        guard let actualCard = Card(rawValue: char, withWildcard: withWildcard) else {
            XCTFail(
                "Failed to initialize Card with character \"\(char)\"",
                file: file,
                line: line
            )
            return
        }
        
        XCTAssertEqual(
            actualCard, expectedCard,
            "Expecting card of type \(expectedCard) got \(actualCard) instead.",
            file: file,
            line: line
        )
        
        XCTAssertEqual(
            actualCard.rank, expectedRank,
            "Expecting card rank of \(expectedCard) got \(actualCard.rank) instead.",
            file: file,
            line: line
        )
    }
}

// MARK: - Part 1 Test(s)
extension Day07Tests {
    func test_part1() throws {
        let challenge = Day07(data: sampleData)
        XCTAssertEqual(String(describing: challenge.part1()), "6440")
    }
}

// MARK: - Part 2 Test(s)
extension Day07Tests {
    func test_part2() throws {
        let challenge = Day07(data: sampleData)
        XCTAssertEqual(String(describing: challenge.part2()), "5905")
    }
}

// MARK: - Hand Test(s)
extension Day07Tests {
    func test_Hand_ForSampleDataLine1() {
        let input = sampleData_line1
        
        assert(
            input,
            withWildcard: false,
            isType: .onePair,
            withCards: [.three, .two, .ten, .three, .king],
            bid: 765,
            rank: (2, [2, 1, 9, 2, 12])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .onePair,
            withCards: [.three, .two, .ten, .three, .king],
            bid: 765,
            rank: (2, [2, 1, 9, 2, 12])
        )
    }
    
    func test_Hand_ForSampleDataLine2() {
        let input = sampleData_line2
        
        assert(
            input,
            withWildcard: false,
            isType: .threeOfAKind,
            withCards: [.ten, .five, .five, .jack(wild: false), .five],
            bid: 684,
            rank: (4, [9, 4, 4, 10, 4])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .fourOfAKind,
            withCards: [.ten, .five, .five, .jack(wild: true), .five],
            bid: 684,
            rank: (6, [9, 4, 4, 0, 4])
        )
    }
        
    func test_Hand_ForSampleDataLine3() {
        let input = sampleData_line3

        assert(
            input,
            withWildcard: false,
            isType: .twoPair,
            withCards: [.king, .king, .six, .seven, .seven],
            bid: 28,
            rank: (3, [12, 12, 5, 6, 6])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .twoPair,
            withCards: [.king, .king, .six, .seven, .seven],
            bid: 28,
            rank: (3, [12, 12, 5, 6, 6])
        )
    }
    
    func test_Hand_ForSampleDataLine4() {
        let input = sampleData_line4
        
        assert(
            input,
            withWildcard: false,
            isType: .twoPair,
            withCards: [.king, .ten, .jack(wild: false), .jack(wild: false), .ten],
            bid: 220,
            rank: (3, [12, 9, 10, 10, 9])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .fourOfAKind,
            withCards: [.king, .ten, .jack(wild: true), .jack(wild: true), .ten],
            bid: 220,
            rank: (6, [12, 9, 0, 0, 9])
        )
    }
    
    func test_Hand_ForSampleDataLine5() {
        let input = sampleData_line5
        
        assert(
            input,
            withWildcard: false,
            isType: .threeOfAKind,
            withCards: [.queen, .queen, .queen, .jack(wild: false), .ace],
            bid: 483,
            rank: (4, [11, 11, 11, 10, 13])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .fourOfAKind,
            withCards: [.queen, .queen, .queen, .jack(wild: true), .ace],
            bid: 483,
            rank: (6, [11, 11, 11, 0, 13])
        )
    }
   
    func test_Hand_ForCards_23456() {
        let input =  "23456 420"
        
        assert(
            input,
            withWildcard: false,
            isType: .highCard,
            withCards: [.two, .three, .four, .five, .six],
            bid: 420,
            rank: (1, [1, 2, 3, 4, 5])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .highCard,
            withCards: [.two, .three, .four, .five, .six],
            bid: 420,
            rank: (1, [1, 2, 3, 4, 5])
        )
    }
    
    func test_Hand_ForCards_789TJ() {
        let input =  "789TJ 420"
        
        assert(
            input,
            withWildcard: false,
            isType: .highCard,
            withCards: [.seven, .eight, .nine, .ten, .jack(wild: false)],
            bid: 420,
            rank: (1, [6, 7, 8, 9, 10])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .onePair,
            withCards: [.seven, .eight, .nine, .ten, .jack(wild: true)],
            bid: 420,
            rank: (2, [6, 7, 8, 9, 0])
        )
    }
    
    func test_Hand_ForCards_23TTJ() {
        let input = "23TTJ 420"
                
        assert(
            input,
            withWildcard: false,
            isType: .onePair,
            withCards: [.two, .three, .ten, .ten, .jack(wild: false)],
            bid: 420,
            rank: (2, [1, 2, 9, 9, 10])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .threeOfAKind,
            withCards: [.two, .three, .ten, .ten, .jack(wild: true)],
            bid: 420,
            rank: (4, [1, 2, 9, 9, 0])
        )
    }
    
    func test_Hand_ForCards_2233J() {
        let input = "2233J 420"
        
        assert(
            input,
            withWildcard: false,
            isType: .twoPair,
            withCards: [.two, .two, .three, .three, .jack(wild: false)],
            bid: 420,
            rank: (3, [1, 1, 2, 2, 10])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .fullHouse,
            withCards: [.two, .two, .three, .three, .jack(wild: true)],
            bid: 420,
            rank: (5, [1, 1, 2, 2, 0])
        )
    }
    
    func test_Hand_ForCards_4444J() {
        let input = "4444J 420"
        
        assert(
            input,
            withWildcard: false,
            isType: .fourOfAKind,
            withCards: [.four, .four, .four, .four, .jack(wild: false)],
            bid: 420,
            rank: (6, [3, 3, 3, 3, 10])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .fiveOfAKind,
            withCards: [.four, .four, .four, .four, .jack(wild: true)],
            bid: 420,
            rank: (7,  [3, 3, 3, 3, 0])
        )
    }
    
    func test_Hand_ForCards_444JJ() {
        let input = "444JJ 420"
        
        assert(
            input,
            withWildcard: false,
            isType: .fullHouse,
            withCards: [.four, .four, .four, .jack(wild: false), .jack(wild: false)],
            bid: 420,
            rank: (5, [3, 3, 3, 10, 10])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .fiveOfAKind,
            withCards: [.four, .four, .four, .jack(wild: true), .jack(wild: true)],
            bid: 420,
            rank: (7, [3, 3, 3, 0, 0])
        )
    }
    
    func test_Hand_ForCards_44JJJ() {
        let input = "44JJJ 420"
        
        assert(
            input,
            withWildcard: false,
            isType: .fullHouse,
            withCards: [.four, .four, .jack(wild: false), .jack(wild: false), .jack(wild: false)],
            bid: 420,
            rank: (5, [3, 3, 10, 10, 10])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .fiveOfAKind,
            withCards: [.four, .four, .jack(wild: true), .jack(wild: true), .jack(wild: true)],
            bid: 420,
            rank: (7, [3, 3, 0, 0, 0])
        )
    }
    
    func test_Hand_ForCards_4JJJJ() {
        let input = "4JJJJ 420"
        
        assert(
            input,
            withWildcard: false,
            isType: .fourOfAKind,
            withCards: [.four, .jack(wild: false), .jack(wild: false), .jack(wild: false), .jack(wild: false)],
            bid: 420,
            rank: (6, [3, 10, 10, 10, 10])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .fiveOfAKind,
            withCards: [.four, .jack(wild: true), .jack(wild: true), .jack(wild: true), .jack(wild: true)],
            bid: 420,
            rank: (7, [3, 0, 0, 0, 0])
        )
    }
    
    func test_Hand_ForCards_JJJJJ() {
        let input = "JJJJJ 420"
        
        assert(
            input,
            withWildcard: false,
            isType: .fiveOfAKind,
            withCards: [.jack(wild: false), .jack(wild: false), .jack(wild: false), .jack(wild: false), .jack(wild: false)],
            bid: 420,
            rank: (7, [10, 10, 10, 10, 10])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .fiveOfAKind,
            withCards: [.jack(wild: true), .jack(wild: true), .jack(wild: true), .jack(wild: true), .jack(wild: true)],
            bid: 420,
            rank: (7, [0, 0, 0, 0, 0])
        )
    }
    
    func test_Hand_ForCards_2333J() {
        let input = "2333J 420"
        
        assert(
            input,
            withWildcard: false,
            isType: .threeOfAKind,
            withCards: [.two, .three, .three, .three, .jack(wild: false)],
            bid: 420,
            rank: (4, [1, 2, 2, 2, 10])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .fourOfAKind,
            withCards: [.two, .three, .three, .three, .jack(wild: true)],
            bid: 420,
            rank: (6, [1, 2, 2, 2, 0])
        )
    }
    
    func test_Hand_ForCards_233JJ() {
        let input = "233JJ 420"
        
        assert(
            input,
            withWildcard: false,
            isType: .twoPair,
            withCards: [.two, .three, .three, .jack(wild: false), .jack(wild: false)],
            bid: 420,
            rank: (3, [1, 2, 2, 10, 10])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .fourOfAKind,
            withCards: [.two, .three, .three, .jack(wild: true), .jack(wild: true)],
            bid: 420,
            rank: (6, [1, 2, 2, 0, 0])
        )
    }
    
    func test_Hand_ForCards_2345J() {
        let input = "2345J 420"
        
        assert(
            input,
            withWildcard: false,
            isType: .highCard,
            withCards: [.two, .three, .four, .five, .jack(wild: false)],
            bid: 420,
            rank: (1, [1, 2, 3, 4, 10])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .onePair,
            withCards: [.two, .three, .four, .five, .jack(wild: true)],
            bid: 420,
            rank: (2, [1, 2, 3, 4, 0])
        )
    }
    
    func test_Hand_ForCards_QJJQ2() {
        let input = "QJJQ2 420"
        
        assert(
            input,
            withWildcard: false,
            isType: .twoPair,
            withCards: [.queen, .jack(wild: false), .jack(wild: false), .queen, .two],
            bid: 420,
            rank: (3, [11, 10, 10, 11, 1])
        )
        
        assert(
            input,
            withWildcard: true,
            isType: .fourOfAKind,
            withCards: [.queen, .jack(wild: true), .jack(wild: true), .queen, .two],
            bid: 420,
            rank: (6, [11, 0, 0, 11, 1])
        )
    }
}

// MARK: - HandType Test(s)
extension Day07Tests {
    func test_HandType_fiveOfAKind_WithoutWildcard() {
        assert("AAAAA", withWildcard: false, isHandType: .fiveOfAKind, rank: 7)
    }
    
    func test_HandType_fourOfAKind_WithoutWildcard() {
        assert("AA8AA", withWildcard: false, isHandType: .fourOfAKind, rank: 6)
    }
    
    func test_HandType_fullHouse_WithoutWildcard() {
        assert("23332", withWildcard: false, isHandType: .fullHouse, rank: 5)
    }
    
    func test_HandType_threeOfAKind_WithoutWildcard() {
        assert("TTT98", withWildcard: false, isHandType: .threeOfAKind, rank: 4)
    }
    
    func test_HandType_twoPair_WithoutWildcard() {
        assert("23432", withWildcard: false, isHandType: .twoPair, rank: 3)
    }
    
    func test_HandType_onePair_WithoutWildcard() {
        assert("A23A4", withWildcard: false, isHandType: .onePair, rank: 2)
    }
    
    func test_HandType_highCard_WithoutWildcard() {
        assert("23456", withWildcard: false, isHandType: .highCard, rank: 1)
    }
}

// MARK: - Card Test(s)
extension Day07Tests {
    func test_Card_ace() {
        assert("A", withWildcard: false, isCard: .ace, rank: 13)
        assert("A", withWildcard: true, isCard: .ace, rank: 13)
    }
    
    func test_Card_king() {
        assert("K", withWildcard: false, isCard: .king, rank: 12)
        assert("K", withWildcard: true, isCard: .king, rank: 12)
    }
    
    func test_Card_queen() {
        assert("Q", withWildcard: false, isCard: .queen, rank: 11)
        assert("Q", withWildcard: true, isCard: .queen, rank: 11)
    }
    
    func test_Card_jack() {
        assert("J", withWildcard: false, isCard: .jack(wild: false), rank: 10)
        assert("J", withWildcard: true, isCard: .jack(wild: true), rank: 0)
    }
    
    func test_Card_ten() {
        assert("T", withWildcard: false, isCard: .ten, rank: 9)
        assert("T", withWildcard: true, isCard: .ten, rank: 9)
    }
    
    func test_Card_nine() {
        assert("9", withWildcard: false, isCard: .nine, rank: 8)
        assert("9", withWildcard: true, isCard: .nine, rank: 8)
    }
    
    func test_Card_eight() {
        assert("8", withWildcard: false, isCard: .eight, rank: 7)
        assert("8", withWildcard: true, isCard: .eight, rank: 7)
    }
    
    func test_Card_seven() {
        assert("7", withWildcard: false, isCard: .seven, rank: 6)
        assert("7", withWildcard: true, isCard: .seven, rank: 6)
    }
    
    func test_Card_six() {
        assert("6", withWildcard: false, isCard: .six, rank: 5)
        assert("6", withWildcard: true, isCard: .six, rank: 5)
    }
    
    func test_Card_five() {
        assert("5", withWildcard: false, isCard: .five, rank: 4)
        assert("5", withWildcard: true, isCard: .five, rank: 4)
    }
    
    func test_Card_four() {
        assert("4", withWildcard: false, isCard: .four, rank: 3)
        assert("4", withWildcard: true, isCard: .four, rank: 3)
    }
    
    func test_Card_three() {
        assert("3", withWildcard: false, isCard: .three, rank: 2)
        assert("3", withWildcard: true, isCard: .three, rank: 2)
    }
    
    func test_Card_two() {
        assert("2", withWildcard: false, isCard: .two, rank: 1)
        assert("2", withWildcard: true, isCard: .two, rank: 1)
    }
}

private extension HandType {
    init(
        for string: String,
        withWildcard: Bool
    ) {
        let cards = string.compactMap { Card(rawValue: $0, withWildcard: withWildcard) }
        self.init(for: cards, withWildcard: withWildcard)
    }
}


