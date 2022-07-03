//  Created by Bahadir Etka Kilinc

struct RunLengthEncoding{
    static func encode(_ input: String) -> String{
        guard !input.contains(" ") else{return input}

        var lastChar = input.first!
        var count = 0
        var result = ""
        for char in input{
            if char != lastChar{
                result += count == 1 ? "\(lastChar)" : "\(count)\(lastChar)"
                count = 0
            }
            count += 1
            lastChar = char
        }
        result += count == 1 ? "\(lastChar)" : "\(count)\(lastChar)"
        return result
    }
    static func decode(_ input: String) -> String{
        var num = 0
        var result = ""
        for char in input{
            if let numValue = char.wholeNumberValue{
                num = (num * 10) + numValue
            }else{
                if num == 0 {result += String(char)}
                else {for _ in 0..<num{result += String(char)}}
                num = 0
            }
        }
        return result
    }
}