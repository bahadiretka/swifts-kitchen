//  Created by Bahadir Etka Kilinc

struct WordCount{
    let word: String
    let alphabet = "abcdefghijklmnopqrstuvwxyz0123456789"
    func count() -> [String:Int] {
        var dict = [String:Int]()
        let filtered = word.split(separator: " ")
                .map{String($0.lowercased())}
                .map{(str) -> String in
                    return str.filter{ alphabet.contains($0)}
                }.filter{$0.count != 0}
        for word in filtered{
            dict[word,default: 0] += 1
        }
        return dict
    }
}