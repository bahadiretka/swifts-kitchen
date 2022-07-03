//  Created by Bahadir Etka Kilinc

struct Robot{
    var characterNumber: Int
    var digitNumber: Int
    var name: String = ""
    init(characterNumber: Int = 2, digitNumber: Int = 3){
        self.characterNumber = characterNumber
        self.digitNumber = digitNumber
        name = reset()
    }
    mutating func resetName(){
        name = reset()
    }
    func reset() -> String{
        let characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let digits = "0123456789"
        var result = ""
        for _ in 0..<characterNumber{
            result += String(characters.randomElement()!)
        }
        for _ in 0..<digitNumber{
            result += String(digits.randomElement()!)
        }
        return result
    }
}