//  Created by Bahadir Etka Kilinc


struct Squares {
    let number: Int
    var squareOfSum: Int {
        get {
            var result = 0
            for n in 1...number {
                result += n
            }
            return squareOfNumber(result)
        }
    }
    var sumOfSquares: Int  {
        get {
            var result = 0
            for n in 1...number {
                result += squareOfNumber(n)
            }
            return result
        }
    }
    var differenceOfSquares: Int  {
        get {
            return squareOfSum - sumOfSquares
        }
    }
    
    init(_ number: Int) {
        self.number = number
    }
    func squareOfNumber(_ number: Int) -> Int{
        return number * number                                
    }
}
