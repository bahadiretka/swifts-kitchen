//  Created by Bahadir Etka Kilinc


struct SecretHandshake{
    var decimalNumber: Int
    var commands: [String]{
        get{
            var result = [String]()
            
            if decimalNumber & 1 != 0 { result.append("wink") }
            if decimalNumber & 2 != 0 { result.append("double blink") }
            if decimalNumber & 4 != 0 { result.append("close your eyes") }
            if decimalNumber & 8 != 0 { result.append("jump") }
            if decimalNumber & 16 != 0 { result = result.reversed() }
            
            return result
        }
    }
    init(_ decimal: Int){
        decimalNumber = decimal
    }
}