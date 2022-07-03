//  Created by Bahadir Etka Kilinc

import Foundation
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
    func at(_ index: Int) -> Character?{
        if index < 0 || index >= self.count{
            return nil
        }
        for (i,char) in self.enumerated(){
            if i == index{
                return char
            }
        }
        return nil
    }
}

struct Crypto{
    let normalizePlaintext: String
    init(_ input: String){
        normalizePlaintext = input.filter{ !". ,#$%^&!".contains($0) }.map{$0.lowercased()}.joined()
    }
    var size: Int{
        get{
            let length = normalizePlaintext.count
            let row = Int(sqrt(Double(length)).rounded(.down))
            if row * row >= length{
                return row
            }
            else{
                return row+1
            }
        }
    }
    var plaintextSegments: [String]{
        get{
            normalizePlaintext.split(by: size).split(separator: " ").map{String($0)}
        }
    }
    var ciphertext: String{
        get{
            var result = ""
            for i in 0..<size{
                for j in 0..<plaintextSegments.count{
                    if let char = plaintextSegments[j].at(i){
                        result.append(char)
                    }
                }
            }
            return result
        }
    }
    var normalizeCiphertext: String{
        get{
            return ciphertext.split(by: size-1)
        }
    }
}