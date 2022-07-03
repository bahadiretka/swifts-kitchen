//  Created by Bahadir Etka Kilinc

struct Pangram{
    static let characters = "a"..."z"
    static func isPangram(_ input: String) -> Bool{
        let result = input.filter{ characters.contains(String($0.lowercased()))}.reduce([String]()) { partialResult, char in
            if !partialResult.contains(char.lowercased()){
                return partialResult + [char.lowercased()]
            }
            return partialResult + []
        }
        return 26 == result.count
    }
}