import Algorithms

struct Day07: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [String] {
        data.split(separator: "\n").compactMap(String.init)
    }
    
    func part1() -> Any {
        determineWinnings(withWildcard: false)
    }
    
    func part2() -> Any {
        determineWinnings(withWildcard: true)
    }
    
    private func determineWinnings(withWildcard: Bool) -> Int {
        var hands = [Hand]()
        for entity in entities {
            hands.append(Hand(input: entity, withWildcard: withWildcard))
        }
        
        hands.sort {
            if $0.rank.typeRank == $1.rank.typeRank {
                
                for cardRanks in zip($0.rank.cardRanks, $1.rank.cardRanks) where cardRanks.0 != cardRanks.1  {
                    return cardRanks.0 < cardRanks.1
                }
                
                return $0.rank.typeRank < $1.rank.typeRank
                
            } else  {
                return $0.rank.typeRank < $1.rank.typeRank
            }
        }
        
        var totalWinnings = 0
        for (index, hand) in hands.enumerated() {
            totalWinnings = totalWinnings + (hand.bid * (index + 1))
        }
        
        return totalWinnings
    }
}


struct Hand {
    typealias Rank = (typeRank: Int, cardRanks: [Int])
    
    let cards: [Card]
    let type: HandType
    let bid: Int
    var rank: Rank {
        (type.rank, cards.map { $0.rank })
    }
    
    init(
        input: String,
        withWildcard: Bool
    ) {
        let components = input.split(separator: " ")
        let cards = components[0].compactMap { Card(rawValue: $0, withWildcard: withWildcard) }
        guard
            cards.count == 5,
            let bid = Int(components[1])
        else {
            fatalError()
        }
        
        self.bid = bid
        self.cards = cards
        self.type = HandType(for: self.cards, withWildcard: withWildcard)
    }
}

enum HandType {
    case fiveOfAKind
    case fourOfAKind
    case fullHouse
    case threeOfAKind
    case twoPair
    case onePair
    case highCard
    
    var rank: Int {
        let rank: Int
        
        switch self {
        case .fiveOfAKind:
            rank = 7
        case .fourOfAKind:
            rank = 6
        case .fullHouse:
            rank = 5
        case .threeOfAKind:
            rank = 4
        case .twoPair:
            rank = 3
        case .onePair:
            rank = 2
        case .highCard:
            rank = 1
        }
        
        return rank
    }
    
    init(
        for cards: [Card],
        withWildcard: Bool
    ) {
        guard cards.count == 5 else { fatalError() }
        
        var dict = [Card: Int]()
        for card in cards {
            let cardCount = dict[card, default: 0]
            dict[card] = cardCount + 1
        }
        
        if withWildcard {
            self = HandType.determineWildcardSelf(from: dict)
            
        } else {
            self = HandType.determineSelf(from: dict)
        }
        
    }
    
    private static func determineSelf(from dict: [Card: Int]) -> Self {
        let type: HandType
        if dict.count == 1 {
            type = .fiveOfAKind
            
        } else if dict.count == 2 {
            if dict.values.contains(4) {
                type = .fourOfAKind
                
            } else {
                type = .fullHouse
            }
            
        } else if dict.count == 3 {
            if dict.values.contains(3) {
                type = .threeOfAKind
                
            } else {
                type = .twoPair
            }
            
        } else if dict.count == 4 {
            type = .onePair
            
        } else {
            type = .highCard
        }
        
        return type
    }
    
    private static func determineWildcardSelf(from dict: [Card: Int]) -> Self {
        
        guard let jackCount = dict[.jack(wild: true)] else {
            return determineSelf(from: dict)
        }
        
        /*
         4444J 4 + 1 with 2
         444JJ 3 + 2 with 2
         44JJJ 2 + 3 with 2
         4JJJJ 1 + 4 with 2
         JJJJJ 0 + 5 with 2
         
         */
        
        let type: HandType
        if dict.count == 1 || dict.count == 2  {
            type = .fiveOfAKind
            
        } else if dict.count == 3  {
            if dict.values.contains(2) && jackCount == 2 {
                type = .fourOfAKind
                
            } else {
                if dict.values.contains(2) && jackCount == 1  {
                    type = .fullHouse
                } else {
                    type = .fourOfAKind
                }
            }
        } else if dict.count == 4 {
            type = .threeOfAKind
            
        } else {
            type = .onePair
        }
        
        return type
    }
}

enum Card: Hashable {
    case ace
    case king
    case queen
    case jack(wild: Bool)
    case ten
    case nine
    case eight
    case seven
    case six
    case five
    case four
    case three
    case two
    
    init?(
        rawValue: Character,
        withWildcard: Bool
    ) {
        switch rawValue {
        case "A":
            self = .ace
            
        case "K":
            self = .king
            
        case "Q":
            self = .queen
            
        case "J":
            self = .jack(wild: withWildcard)
            
        case "T":
            self = .ten
            
        case "9":
            self = .nine
            
        case "8":
            self = .eight
            
        case "7":
            self = .seven
            
        case "6":
            self = .six
            
        case "5":
            self = .five
            
        case "4":
            self = .four
            
        case "3":
            self = .three
            
        case "2":
            self = .two
            
        default:
            return nil
        }

    }
    
    var rank: Int {
        let rank: Int
        
        switch self {
        case .ace:
            rank = 13
        case .king:
            rank = 12
        case .queen:
            rank = 11
        case let .jack(wild):
            if wild {
                rank = 0
                
            } else {
                rank = 10
            }
        case .ten:
            rank = 9
        case .nine:
            rank = 8
        case .eight:
            rank = 7
        case .seven:
            rank = 6
        case .six:
            rank = 5
        case .five:
            rank = 4
        case .four:
            rank = 3
        case .three:
            rank = 2
        case .two:
            rank = 1
        }
        
        return rank
    }
}
