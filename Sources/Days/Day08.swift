import Algorithms

struct Node {
    let value: String
    let children: (leftKey: String, rightKey: String)
}

enum Direction {
    case left, right
    
    init?(_ s: String.Element) {
        switch s {
        case "L": self = .left
        case "R": self = .right
        default: return nil
        }
    }
}

struct Day08: AdventDay {
    typealias Nodes = [String: ChildNode]
    typealias ChildNode = (leftKey: String, rightKey: String, cycleCount)
    
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [[String]] {
        data.split(separator: "\n\n").map {
            $0.split(separator: "\n").compactMap { String($0) }
        }
    }
    
    func part1() -> Any {
        let instuctions = entities[0][0].compactMap(Direction.init)
        let nodeStrings = entities[1]
        
        var nodes = Nodes()
        
        for nodeString in nodeStrings {
            let components = nodeString.split(separator: " = ")
            let key = String(components[0])
            let nextNodes = components[1]
                .split(separator: ", ")
                .compactMap(String.init)
                .map {
                    $0.trimmingCharacters(in: .punctuationCharacters)
                }
            
            nodes[key] = (leftKey: nextNodes[0], rightKey: nextNodes[1])
        }
        
        var currentNode = "AAA"
        var childNode = nodes[currentNode]!
        
        var i = 0
        var stepCount = 0
        var foundZZZ = false
        
        while !foundZZZ {
            if currentNode == "ZZZ" {
                foundZZZ = true
                break
            }
            let currentInstruction = instuctions[i]
            
            switch currentInstruction {
            case .left:
                currentNode = childNode.leftKey
                
            case .right:
                currentNode = childNode.rightKey
            }
            
            childNode = nodes[currentNode]!
            stepCount = stepCount + 1
            
            if i + 1 < instuctions.count {
                i = i + 1
                
            } else {
                i = 0
            }
        }
        
        return stepCount
    }
    
    func part2() -> Any {
        let instuctions = entities[0][0].compactMap(Direction.init)
        let nodeStrings = entities[1]
        
        var nodes = Nodes()
        
        for nodeString in nodeStrings {
            let components = nodeString.split(separator: " = ")
            let key = String(components[0])
            let nextNodes = components[1]
                .split(separator: ", ")
                .compactMap(String.init)
                .map {
                    $0.trimmingCharacters(in: .punctuationCharacters)
                }
            
            nodes[key] = (leftKey: nextNodes[0], rightKey: nextNodes[1])
        }
        
        var currentNodes: [String] = nodes.keys.filter { $0.last == "A" }
        var childNodes: [ChildNode] = currentNodes.compactMap { nodes[$0] }
        
        var i = 0
        var stepCount = 0
        var foundZZZ = false
        
        while !foundZZZ {
            if currentNodes.allSatisfy({ $0.last == "Z"}) {
                foundZZZ = true
                break
            }
            let currentInstruction = instuctions[i]
            
            switch currentInstruction {
            case .left:
                currentNodes = childNodes.map { $0.leftKey }
                
            case .right:
                currentNodes = childNodes.map { $0.rightKey }
            }
            
            
            childNodes = currentNodes.compactMap { nodes[$0] }
            stepCount = stepCount + 1
            
            if i + 1 < instuctions.count {
                i = i + 1
                
            } else {
                i = 0
            }
        }
        
        return stepCount
    }
}
