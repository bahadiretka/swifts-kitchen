//  Created by Bahadir Etka Kilinc

extension String{
    func split(with seperator: String = " ",by number: Int) -> String{
        var result = ""
        for (index,char) in self.enumerated(){
            result.append(char)
            if (index+1) % number == 0 && index != self.count - 1{
                result += seperator
            }
        }
        return result
    }
}
extension Character {
    func upperCased() -> Character {
        if(self.isUppercase){
            return self
        }
        return Character(self.uppercased())
    }
    func lowerCased() -> Character {
        if(self.isLowercase){
            return self
        }
        return Character(self.lowercased())
    }
}
struct AtbashCipher{
    static var plain = Array("abcdefghijklmnopqrstuvwxyz")
    static func encode(_ input: String) -> String{
        var cipher = [Character : Character]()
        (0..<26).forEach{
            cipher[plain[$0]] = plain[plain.count - $0 - 1]
        }
        return input.filter{!" ,.".contains($0)}.map {
            String(cipher[$0.lowerCased(),default: $0])
        }.joined().split(by: 5)
    }
}