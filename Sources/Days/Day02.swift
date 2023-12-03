import Algorithms

struct Day02: AdventDay {
    struct Game {
        let id: Int
        let red: Int
        let green: Int
        let blue: Int
        
        init?(string: String) {
            
            var red = Int.min
            var green = Int.min
            var blue = Int.min
            
            let segments = string.split(separator: ":")
            let gameSegment = segments.first!.split(separator: " ")
            let colorSegments = segments.last!.split(separator: "; ")
            let id = Int(gameSegment.last!)!
            
            for colorSegment in colorSegments {
                let colors = colorSegment.split(separator: ", ")
                print("colors: \(colors)")
                
                for color in colors {
                    let c = color.filter { !$0.isWhitespace}
                    if c.contains("red") {
                        
                        red = max(red, Int(c.trimmingCharacters(in: .lowercaseLetters))!)
                        
                    } else if c.contains("blue") {
                        blue = max(blue, Int(c.trimmingCharacters(in: .lowercaseLetters))!)
                        
                    } else if c.contains("green") {
                        green = max(green, Int(c.trimmingCharacters(in: .lowercaseLetters))!)
                        
                    } else {
                        return nil
                    }
                }
            }
            
            self.id = id
            self.red = red
            self.green = green
            self.blue = blue
        }
    }
    
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    private let maxRed = 12
    private let maxGreen = 13
    private let maxBlue = 14
    
    // Splits input data into its component parts and convert from string.
    var entities: [Game] {
        data
            .split(separator: "\n")
            .compactMap { Game(string: String($0)) }
    }
    
    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        // Calculate the sum of the first set of input data
        var sum = 0
        
        for entity in entities {
            if entity.red <= maxRed,
               entity.blue <= maxBlue,
               entity.green <= maxGreen {
                sum = sum + entity.id
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
