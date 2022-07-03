//  Created by Bahadir Etka Kilinc


struct IsbnVerifier{
    
    static func isValid(_ input: String) -> Bool{
        if input.count == 10 || input.count == 13{
            var intArray = [Int]()
            for char in input{
                if char >= "0" && char <= "9"{
                    intArray.append(char.wholeNumberValue!)
                }
            }
            var total = 0
            if intArray.count == 10{
                for i in 0..<10{
                    total += intArray[i] * (10-i)
                }
                
            }else if intArray.count == 9 && input.last == "X"{
                for i in 0..<9{
                    total += intArray[i] * (10-i)
                }
                total += 10
            }else{
                return false
            }
            if total % 11 == 0{
                return true
            }else{
                return false
            }
        }
        return false
    }
}