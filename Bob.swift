//  Created by Bahadir Etka Kilinc


extension String{
    func isAllUpperCase()->Bool{
        for ch in self{
           if ch.isLowercase{
                return false
           }
        }
        return true
    }
    func isThereQuestionMarkAtEnd()->Bool{
        if self.last == "?"{
            return true
        }
        return false
    }
    func isEmptyOrAllCharactersBlank() -> Bool{
        if self.isEmpty{
            return true
        }
        for ch in self{
            if ch != " "{
                return false
            }
        }
        return true
    }
    func isThereLetter() -> Bool{
        for ch in self{
           if ch.isLetter{
                return true
           }
        }
        return false
    }
}
enum Answers: String{
    case whatever = "Whatever."
    case sure = "Sure."
    case whoa = "Whoa, chill out!"
    case fine = "Fine. Be that way!"
    
    init?(_ input: String){
        if input.isThereLetter() && input.isAllUpperCase(){
            self = .whoa
        }else if input.isThereQuestionMarkAtEnd(){
            self = .sure
        }else if input.isEmptyOrAllCharactersBlank(){
            self = .fine
        }else{
            self = .whatever
        }
    }
}
struct Bob{
    static func hey(_ input: String) -> String{
        let answer = Answers(input)
        return answer!.rawValue
    }
}