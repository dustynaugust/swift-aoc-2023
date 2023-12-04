import Algorithms

struct Day03: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [[String.Element]] {
        data.split(separator: "\n")
            .compactMap(String.init)
            .compactMap(Array.init)
    }
    
    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        let symbols: Set<String.Element> = Set(
            Array(entities.joined())
                .filter { $0 != "." }
                .filter { !$0.isNumber }
                .map(String.Element.init)
        )
        
        guard !entities.isEmpty else { fatalError("Unexpected Input Data") }
        
        let rowBoundary = entities.count - 1
        let colBoundary = entities[0].count - 1
        var row = 0
        var col = 0
        
        var strings = [String]()
        
        while row <= rowBoundary {
            while col <= colBoundary {
                var potential = ""
                // Get potential numbers
                var tempCol = col
                var current = entities[row][tempCol]
                
                while current.isNumber,
                      tempCol <= colBoundary {
                    potential.append(current)
                    tempCol = tempCol + 1
                    
                    if tempCol <= colBoundary {
                        current = entities[row][tempCol]
                    }
                }
                
                if potential.isEmpty {
                    col = col + 1
                    continue
                }
                // Check perimeter of the number
                var potentialCount = potential.count
                tempCol = col
                while potentialCount > 0,
                      tempCol <= colBoundary {
                    
                    let right =     (row    , tempCol + 1)
                    let rightUp =   (row - 1, tempCol + 1)
                    let up =        (row - 1, tempCol)
                    let upLeft =    (row - 1, tempCol - 1)
                    let left =      (row    , tempCol - 1)
                    let leftDown =  (row + 1, tempCol - 1)
                    let down =      (row + 1, tempCol)
                    let downRight = (row + 1, tempCol + 1)
                    
                    if check(entities, contains: symbols, coordinates: right) ||
                        check(entities, contains: symbols,  coordinates: rightUp) ||
                        check(entities, contains: symbols,  coordinates: up) ||
                        check(entities, contains: symbols,  coordinates: upLeft) ||
                        check(entities, contains: symbols,  coordinates: left) ||
                        check(entities, contains: symbols,  coordinates: leftDown) ||
                        check(entities, contains: symbols,  coordinates: down) ||
                        check(entities, contains: symbols,  coordinates: downRight) {
                        strings.append(potential)
                        break
                    }
                    
                    tempCol = tempCol + 1
                    potentialCount = potentialCount - 1
                }
                
                col = col + potential.count
            }
            
            col = 0
            row = row + 1
        }
        
        
        return strings
            .compactMap(Int.init)
            .reduce(0, +)
    }
    
    
    private func check(
        _ matrix: [[String.Element]],
        contains symbols: Set<String.Element>,
        coordinates: (row: Int, col: Int)
    ) -> Bool {
        let rowBoundary = matrix.count - 1
        let colBoundary = matrix[0].count - 1
        let row = coordinates.row
        let col = coordinates.col
        
        guard
            (0...rowBoundary).contains(row),
            (0...colBoundary).contains(col)
        else {
            return false
        }
        
        let value = matrix[row][col]
        return symbols.contains(value)
    }
    
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        // Sum the maximum entries in each set of data
        "TODO"
    }
}

