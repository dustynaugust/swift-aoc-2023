import Algorithms

struct Day05: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [[Int]] {
        data.split(separator: "\n\n").map {
            $0.split(separator: "\n").compactMap { Int($0) }
        }
    }
    
    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        "TODO"
    }
    
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        "TODO"
    }
}
