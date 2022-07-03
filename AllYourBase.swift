//  Created by Bahadir Etka Kilinc

enum BaseError: Error{
    case invalidInputBase
    case invalidOutputBase
    case invalidPositiveDigit
    case negativeDigit
}

struct Base{
    static func outputDigits(inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int]{
        guard inputBase > 1 else {throw BaseError.invalidInputBase }
        guard outputBase > 1 else {throw BaseError.invalidOutputBase}
        var decimalSum = 0
        for element in inputDigits {
            if element < 0 { throw BaseError.negativeDigit }
            if element >= inputBase { throw BaseError.invalidPositiveDigit }
            decimalSum = inputBase * decimalSum + element
        }
        var result = [Int]()
        while decimalSum > 0 {
            result.append(decimalSum % outputBase)
            decimalSum /= outputBase
        }
        return result.reversed()
    }
}