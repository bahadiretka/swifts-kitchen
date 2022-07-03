//  Created by Bahadir Etka Kilinc

struct PhoneNumber: CustomStringConvertible{
    
    var number = "0000000000"
    var areaCode: String{
        get{
            return String(number.prefix(3))
        }
    }
    init(_ startingNumber: String){
        let num = startingNumber.filter { char in
            char >= "0" && char <= "9"
        }
        if num.count == 10 {
            
            number = num
        }else if num.count == 11 && num.first == "1"{
            number = String(num.dropFirst())
        }
    }
    var description: String {
        return "(\(areaCode)) \(number.dropFirst(3).prefix(3))-\(number.dropFirst(6))"
    }
}