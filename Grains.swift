//  Created by Bahadir Etka Kilinc



struct Grains{
    static var total: UInt{
        var sum: UInt = 0
        for i in 1...64{
            sum += UInt(pow(2.0, Double(i-1)))
        }
        return sum
    }
    enum GrainsError: Error{
    case inputTooHigh(String)
    case inputTooLow(String)
    }
    static func square(_ num: Int) throws -> UInt{
        if num <= 0{
            throw self.GrainsError.inputTooLow("Input[\(num)] invalid. Input should be between 1 and 64 (inclusive)")
        }else if num > 64{
            throw self.GrainsError.inputTooHigh("Input[\(num)] invalid. Input should be between 1 and 64 (inclusive)")
        }
        return UInt(pow(2.0, Double(num-1)))
    }
}