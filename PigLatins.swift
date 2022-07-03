//  Created by Bahadir Etka Kilinc

extension Character{
    func isVowel() -> Bool{
        let vovels = "aeiou"
        return vovels.contains(self)
    }
}
struct PigLatin{
    static func translate(_ input: String) -> String{
        return input.components(separatedBy: " ")
            .map{convert($0)}
            .joined(separator: " ")
    }
    static func convert(_ word: String) -> String{
        var converted = word
        let first = converted.removeFirst()
        let second = converted.first!
        let firstTwo = "\(first)\(second)"
        if first.isVowel() {return "\(word)ay"}
        if !first.isVowel() && converted.first!.isVowel() && firstTwo != "qu"{ return "\(converted)\(first)ay" }
        if ["yt","xr"].contains(String(firstTwo)) {return "\(word)ay"}
        converted.removeFirst()
        if converted.first!.isVowel() && firstTwo != "sq" {return "\(converted)\(firstTwo)ay"}
        else{
            let third = converted.removeFirst()
            let firstThree = firstTwo + "\(third)"
            return "\(converted)\(firstThree)ay"
        }
    }
}