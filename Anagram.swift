//  Created by Bahadir Etka Kilinc

struct Anagram{
    let input: String
    init(word: String){
        input = word
    }
    func match(_ words: [String]) -> [String]{
        let sortedInput = String(input.lowercased().sorted())
        return words.reduce([String]()) { partialResult, word in
            if input.lowercased() != word.lowercased(){
                if String(word.lowercased().sorted()) == sortedInput{
                    return partialResult + [word]
                }
            }
            return partialResult + []
        }
    }
}

