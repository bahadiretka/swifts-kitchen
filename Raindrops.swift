//  Created by Bahadir Etka Kilinc

struct Raindrops{
    var input: Int
    var sounds: String{
        get{
            guard (threeAsAFactor || fiveAsAFactor || sevenAsAFactor) else {return "\(input)"}
            var sound = ""
            if threeAsAFactor{
                sound += "Pling"
            }
            if fiveAsAFactor{
                sound += "Plang"
            }
            if sevenAsAFactor{
                sound += "Plong"
            }
            return sound
        }
    }
    var threeAsAFactor: Bool{
        return isDivisible(number: input, by: 3)
    }
    var fiveAsAFactor: Bool{
        return isDivisible(number: input, by: 5)
    }
    var sevenAsAFactor: Bool{
        return isDivisible(number: input, by: 7)
    }
    init(_ input: Int){
        self.input = input
    }
    func isDivisible(number:Int,by digit: Int) -> Bool{
        return number % digit == 0 ? true : false
    }
}