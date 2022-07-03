//  Created by Bahadir Etka Kilinc

struct Queens: CustomStringConvertible{
    
    enum InitError: Error{
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
    }
    
    var white = [Int]()
    var black = [Int]()
    
    var canAttack: Bool{
        return white.first == black.first ||
                white.last == black.last ||
                abs(white[0] - black[0]) == abs(white[1] - black[1])
    }
    var description: String{
        var board : [String] = []
        for j in 0...7 {
           var row : [String] = []
           for i in 0...7 {
              switch [j,i] {
              case self.black: row.append("B")
              case self.white: row.append("W")
              default: row.append("_")
              }
           }
           board.append(row.joined(separator: " "))
        }
        return board.joined(separator: "\n")
    }
    
 
    
    init(white: [Int] = [0,3], black: [Int] = [7,3]) throws{
        guard white.count == 2 && black.count == 2 else{ throw InitError.incorrectNumberOfCoordinates }
        guard isValidCoordinate(white) && isValidCoordinate(black) else{ throw InitError.invalidCoordinates}
        guard !isSameSpace(white, black) else{ throw InitError.sameSpace}
        
        self.white = white
        self.black = black
        
    }
    func isValidCoordinate(_ coordinate: [Int]) -> Bool {
        for element in coordinate{
            if element > 7 || element < 0{
                return false
            }
        }
        return true
    }
    func isSameSpace(_ first: [Int],_ second: [Int]) -> Bool{
        if first[0] == second[0] && first[1] == second[1] {
            return true
        }
        return false
    }
}