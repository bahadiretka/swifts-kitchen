//  Created by Bahadir Etka Kilinc

struct Sieve{
    var upperBound: Int
    var primes: [Int]{
        get{
            var marks = [Bool](repeating: true, count: upperBound-1)
            var primeNumbers = [Int]()
            for number in 2...upperBound{
                for i in stride(from: number + number, to: upperBound + 1, by: number){
                    marks[i-2] = false
                }
            }
            for (index,mark) in marks.enumerated() {
                if mark{ primeNumbers.append(index + 2) }
            }
            return primeNumbers
        }
    }
    init(_ upperBound: Int){
        self.upperBound = upperBound
    }
}