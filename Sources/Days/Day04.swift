import Algorithms
import Foundation

struct Day04: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [String] {
        data
            .split(separator: "\n")
            .compactMap(String.init)
    }
    
    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        var sum = 0
        for string in entities {
            let numbersSection = string.split(separator: ": ").last!
            
            let winningNumbers = Set(
                numbersSection
                    .split(separator: " | ")
                    .first!
                    .split(separator: " ")
                    .map(String.init)
                    .compactMap(Int.init)
            )
            
            let numbers = numbersSection
                .split(separator: " | ")
                .last!
                .split(separator: " ")
                .map(String.init)
                .compactMap(Int.init)
            
            var count = -1
            for number in numbers where winningNumbers.contains(number) {
                count = count + 1
            }
            
            guard count >= 0 else { continue }
            
            sum = sum + Int(pow(2.0, Double(count)))
        }
        
        return sum
    }
    
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        var cards = Array(repeating: 1, count: entities.count)
        
        for (index, string) in entities.enumerated() {
            let numbersSection = string.split(separator: ": ").last!
            
            let winningNumbers = Set(
                numbersSection
                    .split(separator: " | ")
                    .first!
                    .split(separator: " ")
                    .map(String.init)
                    .compactMap(Int.init)
            )
            
            let numbers = numbersSection
                .split(separator: " | ")
                .last!
                .split(separator: " ")
                .map(String.init)
                .compactMap(Int.init)
            
            var winCount = 0
            for number in numbers where winningNumbers.contains(number) {
                winCount = winCount + 1
            }
            
            guard winCount > 0 else { continue }
            
            let currentCountOfWinningCard = cards[index]
            let nextCardIndex = index + 1
            let lastCardToAddIndex = index + winCount
            
            for i in nextCardIndex...lastCardToAddIndex where i <= cards.count {
                cards[i] = cards[i] + currentCountOfWinningCard
            }
        }
        
        return cards.reduce(0, +)
    }
}
