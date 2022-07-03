//  Created by Bahadir Etka Kilinc

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
struct RotationalCipher{
    static var plain = Array("abcdefghijklmnopqrstuvwxyz")
    static func rotate(_ input: String, ROT: Int) -> String{
        var cipher = [Character : Character]()
        (0..<26).forEach{
            cipher[plain[$0]] = plain[($0 + ROT) % 26]
        }
        return input.map {
            String($0.isLowercase ? cipher[$0,default: $0]: cipher[$0.lowerCased(),default: $0].upperCased())
        }.joined()
    }
}