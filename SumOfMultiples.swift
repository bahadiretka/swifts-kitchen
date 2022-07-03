//  Created by Bahadir Etka Kilinc


struct SumOfMultiples{
    static func toLimit(_ limit: Int, inMultiples: [Int]) -> Int{
        var multiples: Set<Int> = []
        guard limit > 0 else{ return 0}
        
        for number in 1..<limit{
            for i in inMultiples{
                guard i != 0 else{ continue }
                if number % i == 0{
                    multiples.insert(number)
                }
            }
        }
        var result = 0
        for i in multiples{
            result += i
        }
        return result
    }
}