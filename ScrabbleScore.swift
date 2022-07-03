//  Created by Bahadir Etka Kilinc


struct Scrabble{
    static let points = ["A": 1, "E": 1, "I": 1, "O": 1, "U": 1, "L": 1, "N": 1, "R": 1, "S": 1, "T": 1, "D":2, "G":2, "B":3,"C":3, "M":3, "P":3, "F":4, "H":4, "V":4, "W":4, "Y":4, "K":5, "J":8, "X":8, "Q":10, "Z":10 ]
    var score: Int
    static func score(_ word: String) -> Int{
        var score = 0
        for char in word {
            if let value = points[String(char).uppercased()] {
                score += value
            }
        }
        return score
    }
    init(_ input: String?){
        score = 0
        if let word = input{
            score = Scrabble.score(word)
        }
        
    }
}