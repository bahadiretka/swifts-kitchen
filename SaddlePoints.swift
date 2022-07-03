//  Created by Bahadir Etka Kilinc
struct SaddlePointsMatrix{
    let list: [[Int]]
    var rows: [[Int]]{
        get{
            return list
        }
    }
    var columns: [[Int]]{
        get{
            var result = [[Int]](repeating: [], count: list[0].count)
            for i in 0..<list.count{
                for j in 0..<list[i].count{
                    result[j].append(list[i][j])
                }
            }
            return result
        }
    }
    var saddlePoints: [[Int]]{
        get{
            var points = [[Int]]()
            for i in 0..<list.count{
                for j in 0..<list[i].count{
                    if list[i][j] == rows[i].max()! && list[i][j] == columns[j].min()!{
                        points += [[i,j]]
                    }
                    
                }
            }
            return points
        }
    }
    init(_ input: String){
        list = input.split(separator: "\n")
                .map{$0.split(separator: " ")}
                .map{$0.map{Int($0)!}}
    }
}
