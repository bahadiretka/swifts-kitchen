//  Created by Bahadir Etka Kilinc

struct MatchingBrackets{
    static func paired(text: String) -> Bool{
        guard !text.isEmpty else{return true}
        var stack = [Character]()
        for element in text{
            switch element{
            case "{","(","[":
                stack.append(element)
            case "}":
                if stack.last == "{"{
                    stack.removeLast()
                }else {return false}
            case ")":
                if stack.last == "("{
                    stack.removeLast()
                }else {return false}
            case "]":
                if stack.last == "["{
                    stack.removeLast()
                }else {return false}
            default:
                ()
            }
        }
        return stack.isEmpty
    }
}