import Algorithms

struct Day05: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [[String]] {
        data.split(separator: "\n\n").map {
            $0.split(separator: "\n")
                .compactMap(String.init)
        }
    }
    
    func part1() -> Any {
        guard let map = MapFactory.makeMaps(from: entities) else { fatalError() }
        
        var minValue = Double.greatestFiniteMagnitude
        
        for seed in map.seeds {
            var value = seed
            
            for mapEntry in map.entries {
                for mapping in mapEntry.maps {
                    if mapping.range.contains(value) {
                        value = mapping.transform(value)
                        break
                    }
                }
            }
            
            minValue = min(minValue, value)
        }
        
        return Int(minValue)
    }
    
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        "TODO"
    }
}

private extension Day05 {
    enum MapFactory {
        typealias Entries = [MapEntry]
        typealias MapEntry = (name: String, maps: [Mapping])
        typealias Mapping = (range: Range, transform: Transformation)
        typealias Transformation = (Double) -> Double
        typealias Range = ClosedRange<Double>
        
        static func makeMaps(
            from alamanac: [[String]]
        ) -> (seeds: [Double],
              entries: Entries)? {
            guard let seeds = getSeeds(from: alamanac) else { return nil }
            
            var entries = Entries()
            for i in 1...7 {
                guard let map = makeMap(i, from: alamanac) else { return nil }
                entries.append(map)
            }
            
            return (seeds, entries)
        }
            
        private static func makeMap(
            _ index: Int,
            from maps: [[String]]
        ) -> MapEntry? {
            guard let (name, map) = getMapInfo(at: index, in: maps) else { return nil }
            
            var mappings = [Mapping]()
            for line in map {
                let desination = line[0]
                let source = line[1]
                let rangeLength = line[2]
                let transformation = (desination - source)
                
                let f: (Double) -> Double = { double in
                    double + transformation
                }
                
                let upperBound = source + rangeLength - 1
                let sourceRange = source...upperBound
                
                mappings.append((sourceRange, f))
            }
            
            return (name, mappings)
        }
        
        private static func getSeeds(
            from arr: [[String]]
        ) -> [Double]? {
            guard arr.indices.contains(0),
                  let seedsLine = arr.first,
                  let seedNumbersString = seedsLine.first.map({ $0.components(separatedBy: ": ") })?.last
            else { return nil }
            
            return seedNumbersString
                .components(separatedBy: " ")
                .compactMap(Double.init)
        }
        
        private static func getMapInfo(
            at index: Int,
            in arr: [[String]]
        ) -> (name: String, numbers: [[Double]])? {
            guard 
                arr.indices.contains(index),
                let name = arr[index].first
            else {
                return nil
            }
            
            let numbers = arr[index]
                .dropFirst()
                .map {
                    $0.components(separatedBy: " ")
                        .compactMap(Double.init)
                }
                .sorted { $0[0] < $1[0] }

            return (name, numbers)
        }
    }
}
