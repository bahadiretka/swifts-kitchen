//  Created by Bahadir Etka Kilinc

struct Isogram{
    static func isIsogram(_ input: String) -> Bool{
        let word = input.lowercased()
        var dict = [Character: Int]()
        for (index, letter) in word.enumerated() {
            if(letter.isLetter){
                if dict[letter] != nil { return false }
                dict[letter] = index
            }
        }
        return true
    }
}