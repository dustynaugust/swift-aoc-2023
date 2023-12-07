import Algorithms

struct Day06: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [String] { data.split(separator: "\n").compactMap(String.init) }
 
    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        let times = entities[0]
            .components(separatedBy: ":")[1]
            .components(separatedBy: .whitespaces)
            .compactMap(Int.init)
        
        let distances = entities[1]
            .components(separatedBy: ":")[1]
            .components(separatedBy: .whitespaces)
            .compactMap(Int.init)
        
        let timesAndDistances = zip(times, distances)
        
        var counts = [Int]()
        for timeAndDistance in timesAndDistances {
            let raceTime = timeAndDistance.0
            let maxDistance = timeAndDistance.1
            
            var count = 0
            for t in 0...raceTime {
                let distance = t * (raceTime - t)
                if  distance > maxDistance {
                    count = count + 1
                }
            }
            
            counts.append(count)
        }
        
        return counts.reduce(1, *)
    }
    
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        guard 
            let raceTime = Int(entities[0].components(separatedBy: ":")[1].replacingOccurrences(of: " ", with: "")),
            let maxDistance = Int(entities[1].components(separatedBy: ":")[1].replacingOccurrences(of: " ", with: ""))
        else { fatalError() }
        
        var counts = [Int]()
        
        var count = 0
        for t in 0...raceTime {
            let distance = t * (raceTime - t)
            if  distance > maxDistance {
                count = count + 1
            }
        }
        
        return count
    }
}
