//  Created by Bahadir Etka Kilinc

struct Diamond{
    static func makeDiamond(letter: String) -> [String]{
        let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        var counter = 0
        for char in alphabet{
            if char != letter{
                counter += 1
            }else{
                break
            }
        }
        let length = 2 * counter + 1
        var upSide = [String](repeating: "", count: counter)
        
        for row in 0..<counter{
            for column in 0..<length{
                if column == counter - row || column == counter + row {
                    upSide[row].append(alphabet[row])
                }else{
                    upSide[row].append(" ")
                }
            }
        }
        
        if length > 1{
            var middle = ""
            middle += letter
            for _ in 1..<length-1{
                middle += " "
            }
            middle += letter
            let downSide = upSide.reversed()
            upSide.append(middle)
            
            return upSide + downSide
        }
        return [letter]
    }
}