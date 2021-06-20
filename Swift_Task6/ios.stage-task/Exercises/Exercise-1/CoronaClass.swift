import Foundation

class CoronaClass {
 
     var seats = [Int]()
     let length: Int

     init(n: Int) {
        length = n
     }
     
     func seat() -> Int {
        if seats.first != 0 {
            seats.insert(0, at: 0)
            return seats.first!
        } else if seats.last != length - 1 {
            seats.append(length-1)
            return seats.last!
        }

        var difference = 0
        var indexToCountFrom = 0
        
        for i in 0..<seats.count-1 {
            let offset = (seats[i+1]-seats[i]) / 2
            if difference < offset {
                indexToCountFrom = i
                difference = offset
            }
        }
        seats.insert(seats[indexToCountFrom] + difference, at: indexToCountFrom+1)
        return seats[indexToCountFrom+1]
     }
     
     func leave(_ p: Int) {
            seats.remove(at: seats.firstIndex(of: p)!)
     }
}
