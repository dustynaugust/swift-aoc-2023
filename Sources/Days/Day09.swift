import Algorithms

struct Day09: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var entities: [[Int]] {
        data
            .components(separatedBy: "\n")
            .map {
                $0.components(separatedBy: " ")
                    .compactMap { Int($0) }
            }
    }
    
    func part1() -> Any {
        /*
         1.
            LIMIT = count-1
            start at i == 1, 2nd element
            
            while ! all elements from 0...LIMIT-1 == 0
                if i > LIMIT
                    update LIMIT to LIMIT-1
                    update i accordingly
            else
                a[i-1] = a[i]-a[i-1]
                update i accordingly
         
         2.
            for a[j] from j = 1...cont-1
                a[j] = a[j-1]+a[j]
         
         3.
            a[count-1] is now prediction
         */
        
        var x = 0
        var sum = 0
        while x <= entities.count - 1 {
            var entity = entities[x]
            
            let count = entity.count
            guard count > 2 else {
                if count == 0 {
                    sum = sum + 0
                    
                } else {
                    sum = sum + entity[1]
                }
                
                break
            }
            
            var i = 1
            var limit = count - 1
            while !entity.prefix(through: limit).allSatisfy({ $0 == 0 }) {
                if i > limit {
                    limit = limit - 1
                    i = 1
                    
                } else {
                    entity[i-1] = entity[i] - entity[i-1]
                    i = i + 1
                }
            }
            
            var j = 1
            while j <= entity.count - 1 {
                entity[j] = entity[j-1] + entity[j]
                j = j + 1
            }
            
            sum = sum + entity[entity.count-1]
            x = x + 1
        }
        
        return sum
    }
    
    func part2() -> Any {
        /*
        1.
            LIMIT = 0
            start at i == count-2, 2nd to last element
            
            while ! all elements from LIMIT..last
                if i < LIMIT
                    update LIMIT to LIMIT+1
                    update i accordingly
            else
                a[i] = a[i]-a[i-1]
                update i accordingly
         
         2.
            for a[j].reversed from j = 1...cont-1
                a[j] = a[j-1]+a[j]
         
         3.
            a[count-1] is now prediction
         */
        
        var x = 0
        var sum = 0
        while x <= entities.count - 1 {
            var entity = entities[x]
            
            let count = entity.count
            guard count > 2 else {
                if count == 0 {
                    sum = sum + 0
                    
                } else {
                    sum = sum + entity[1]
                }
                
                break
            }
            
            var i = count - 2
            var limit = 0
            
            while !entity[limit...count-1].allSatisfy({ $0 == 0 }) {
                if i < limit {
                    limit = limit + 1
                    i = count - 2
                    
                } else {
                    entity[i+1] = entity[i+1] - entity[i]
                    i = i - 1
                }
            }
            
            var j = entity.count - 2
            while 0 <= j {
                entity[j] = entity[j] - entity[j+1]
                j = j - 1
            }
            
            sum = sum + entity[0]
            x = x + 1
        }
        
        return sum
    }
}
