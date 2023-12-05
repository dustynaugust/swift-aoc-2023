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
    
    func part2() -> Any {
        guard !entities.isEmpty else { fatalError("Unexpected Input Data") }
        
        let rowBoundary = entities.count - 1
        let colBoundary = entities[0].count - 1
        var row = 0
        var col = 0
        
        var gearDict = [Coordinate: [String]]()
        
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
                    if let gearCoordinate = checkPerimeterForGrear(row: row, col: tempCol, in: entities) {
                        var array = gearDict[gearCoordinate, default: []]
                        array.append(potential)
                        gearDict[gearCoordinate] = array
                        break
                        
                    } else {
                        tempCol = tempCol + 1
                        potentialCount = potentialCount - 1
                    }
                }
                
                col = col + potential.count
            }
            
            col = 0
            row = row + 1
        }
        
        return gearDict.values
            .filter { $0.count == 2 }
            .map({ $0.compactMap(Int.init) })
            .map { $0.reduce(1, *) }
            .reduce(0, +)
    }
}

extension Day03 {
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
    
    private func checkPerimeterForGrear(
        row: Int,
        col: Int,
        in matrix: [[String.Element]]
    ) -> Coordinate? {
        let gear = Set(Array("*"))
        for direction in Direction.allCases {
            let coordinate = direction.apply(row: row, col: col)
            if check(entities, contains: gear, coordinates: (coordinate.row, coordinate.col)) {
                return coordinate
            }
        }
        
        return nil
    }
    
    struct Coordinate: Hashable {
        let row: Int
        let col: Int
    }
    
    enum Direction: CaseIterable {
        case right
        case rightUp
        case up
        case upLeft
        case left
        case leftDown
        case down
        case downRight
        
        func apply(row: Int, col: Int) -> Coordinate {
            let result: Coordinate
            
            switch self {
            case .right:
                result = Coordinate(row: row    , col: col + 1)
            case .rightUp:
                result = Coordinate(row: row - 1, col: col + 1)
            case .up:
                result = Coordinate(row: row - 1, col: col)
            case .upLeft:
                result = Coordinate(row: row - 1, col: col - 1)
            case .left:
                result = Coordinate(row: row    , col: col - 1)
            case .leftDown:
                result = Coordinate(row: row + 1, col: col - 1)
            case .down:
                result = Coordinate(row: row + 1, col: col)
            case .downRight:
                result = Coordinate(row: row + 1, col: col + 1)
            }
            
            return result
        }
    }
    
}
