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
        // Calculate the sum of the first set of input data
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
            for number in numbers {
                if winningNumbers.contains(number) {
                    count = count + 1
                }
            }
            if count >= 0 {
                sum = sum + Int(pow(2.0, Double(count)))
            }
        }
        
        return sum
    }
    
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        // Sum the maximum entries in each set of data
        "TODO"
    }
}
