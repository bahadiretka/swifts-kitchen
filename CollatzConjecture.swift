//  Created by Bahadir Etka Kilinc

enum CollatzConjectureError: Error{
    case zeroOrNegativeError
}
struct CollatzConjecture{
    static func steps(_ input: Int) throws -> Int{
        if input <= 0 {
            throw CollatzConjectureError.zeroOrNegativeError
        }
        return calculate(input)
    }
    static func calculate(_ input: Int) -> Int{
        if input == 1 {
            return 0
        }
        if input % 2 == 0{
            return 1 + calculate(input / 2)
        }else{
            return 1 + calculate(input * 3 + 1)
        }
    }
}