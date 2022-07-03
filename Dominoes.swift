//  Created by Bahadir Etka Kilinc

extension Array{
    func permutations() -> [[Element]] {
        if self.count < 2 {
            return [self]
        }
        var result: [[Element]] = []
        let rest = Array(self[1...])
        for p in rest.permutations() {
            for i in 0...p.count {
                result.append(Array(p[0..<i]) + [self[0]] + Array(p[i...]))
            }
        }
        return result
    }
}
struct Dominoes{
    var chained: Bool{
        guard !input.isEmpty else {return false}
        if input.count == 1 && input[0].0 == input[0].1 {return true}
        let permutation = input.permutations()
        for i in 0..<permutation.count{
            var connections = 0
            for j in 0..<permutation[i].count - 1{
                if permutation[i][j].1 == permutation[i][j+1].0 ||
                    permutation[i][j].1 == permutation[i][j+1].1 ||
                    permutation[i][j].0 == permutation[i][j+1].0{
                    connections += 1
                }
            }
            if connections == permutation[0].count - 1 &&
                permutation[i][0].0 == permutation[i].last!.1 {return true}
        }
        return false
        
    }
    let input: [(Int,Int)]
    init(_ input: [(Int,Int)]){
        self.input = input
    }
}