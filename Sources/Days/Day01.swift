import Algorithms

struct Day01: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [String] { data.split(separator: "\n").compactMap(String.init) }
    
    private let numbersMap = [
        "one": 1,
        "1": 1,
        "two": 2,
        "2": 2,
        "three": 3,
        "3": 3,
        "four": 4,
        "4": 4,
        "five": 5,
        "5": 5,
        "six": 6,
        "6": 6,
        "seven": 7,
        "7": 7,
        "eight": 8,
        "8": 8,
        "nine": 9,
        "9": 9,
    ]
    
    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        // On each line, the calibration value can be found by combining the first digit and the last digit (in that order) to form a single two-digit number. 
        // Digits include: "one", "1", "two", "2", "three", "3" ,..., "nine", "9"
        // Find the sum of each single two-digit number.
        var sum = 0
        for entity in entities {
            let ints = entity.filter("0123456789.".contains)
                
            // Get all the Int Strings
            guard let firstDigit = ints.first,
                  let lastDigit = ints.last,
                  let number = Int("\(firstDigit)\(lastDigit)")
            else {
                continue
            }
            
            sum = sum + number
        }
        
        return sum
    }
    
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        // On each line, the calibration value can be found by combining the first digit and the last digit (in that order) to form a single two-digit number.
        // Digits are "0", 1", "2", ... "9"
        // Find the sum of each single two-digit number.
        var sum = 0
        for entity in entities {
            var firstDigitString: String? = nil
            var secondDigitString: String? = nil
            
            var left = 0
            var right = 0
            let chars = Array<Character>(entity)
            let boundary = entity.count - 1
            
            while right <= boundary {
                while right <= boundary,
                      let substring = String(chars[right...right]) as String?,
                      !potentialMatch(at: substring) {
                    right = right + 1
                }
                
                left = right
                
                while right <= boundary,
                      let substring = String(chars[left...right]) as String?,
                      potentialMatch(at: substring) {
                    
                    if numbersMap.keys.contains(substring) {
                        if firstDigitString == nil { firstDigitString = substring }
                        secondDigitString = substring
                        // If substring is a number advance ahead by one position.
                        if "123456789".contains(substring) { right = right + 1 }
                        left = right
                        break
                        
                    } else {
                        right = right + 1
                    }
                }
                
                // No potential match found but need to keep right within one position of left
                if right - left > 1 {
                    right = right - 1
                }
            }
            
            guard
                let firstDigit = numbersMap[firstDigitString ?? ""],
                let secondDigit = numbersMap[secondDigitString ?? ""],
                let number = Int("\(firstDigit)\(secondDigit)") 
            else {
                firstDigitString = nil
                secondDigitString = nil
                continue
            }
            
            sum = sum + number
            firstDigitString = nil
            secondDigitString = nil
        }
        
        return sum
    }
    
    private func potentialMatch(at string: String) -> Bool {
        numbersMap.keys.contains(where: { $0.starts(with: string) })
    }
}
