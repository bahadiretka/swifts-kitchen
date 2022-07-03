//  Created by Bahadir Etka Kilinc

struct Series{
    var list: [Int]
    init(_ input: String){
        list = input.map{Int($0.wholeNumberValue!)}
    }
    func slices(_ slice: Int) -> [[Int]]{
        guard slice <= list.count else {return []}
        var result = [[Int]]()
        for i in 0..<list.count - slice{
            result.append(Array(list[i..<i+slice]))
        }
        return result
    }
}
