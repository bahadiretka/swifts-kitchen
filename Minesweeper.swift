//  Created by Bahadir Etka Kilinc

class Board{
    enum BoardError: Error{
        case differentLength
        case faultyBorder
        case invalidCharacter
    }
    var board: [[String]]
    let rows,columns: Int
    init(_ board: [String]) throws{
        guard board.dropFirst().allSatisfy({ $0.count == board.first!.count }) else{ throw BoardError.differentLength}
        guard !board.first!.contains(" ") && !board.last!.contains(" ") else {throw BoardError.faultyBorder}
        guard board.allSatisfy({Set($0).isSubset(of: Set("+-* |"))}) else {throw BoardError.invalidCharacter}
        rows = board.count
        columns = board[0].count
        self.board = board.map{$0.map{String($0)}}
    }
    private func generate(_ row: Int,_ column: Int){
        (-1...1).forEach { i in
            (-1...1).forEach { j in
                change(row + i, column + j)
            }
        }
    }
    private func change(_ r: Int,_ c: Int){
        guard r < rows - 1 && r > 0 else{return}
        guard c < columns - 1 && c > 0 else{return}
        guard board[r][c] != "*" else{return}
        if board[r][c] == " "{
            board[r][c] = "1"
        }else{
            let last = Int(board[r][c])!
            board[r][c] = "\(last + 1)"
        }
    }
    func transform() -> [String]{
        for row in 0..<rows-1{
            for column in 0..<columns-1{
                if board[row][column] == "*"{
                    generate(row, column)
                }
            }
        }
        return board.map{$0.joined()}
    }
}