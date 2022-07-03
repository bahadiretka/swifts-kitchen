//  Created by Bahadir Etka Kilinc

struct FoodChain{
    static let start = "I know an old lady who swallowed a "
    static let text = ["It wriggled and jiggled and tickled inside her.",
                "How absurd to swallow a bird!",
                "Imagine that, to swallow a cat!",
                "What a hog, to swallow a dog!",
                "Just opened her throat and swallowed a goat!",
                "I don't know how she swallowed a cow!",
                "She's dead, of course!"]

    static let middle = ["She swallowed the ",
                    " to catch the "]
    static let ends = ["I don't know why she swallowed the fly. Perhaps she'll die.",
                "She's dead, of course!"]

    static let animals = ["fly","spider","bird","cat","dog","goat","cow","horse"]
    static let exception = " that wriggled and jiggled and tickled inside her"

    
    static func verse(_ val: Int) -> String{
        var result = ""
        result += start
        result += animals[val-1] + ".\n"
        switch val{
        case 1:
            result += ends[0]
        case 2,3,4,5,6,7:
            result += text[val-2] + "\n"
            var middlePart = [String]()
            for i in 0..<val-1{
                middlePart.append(middle[0] + animals[i+1] + middle[1] + animals[i])
                if i == 1{
                    middlePart[1] += exception
                }
                middlePart[i] += ".\n"
            }
            result += middlePart.reversed().joined()
            result += ends[0]
        case 8:
            result += ends[1]
        default:
            ()
        }
        return result
    }
    static func song() -> String{
        var result = [String]()
        (1...8).forEach{
            result.append(verse($0))
        }
        return result.joined(separator: "\n\n")
    }
}