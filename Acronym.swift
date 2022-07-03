//  Created by Bahadir Etka Kilinc

struct Acronym {

    static func abbreviate(_ text: String) -> String{
        let acronym = text.split { " :,-".contains($0) }
            .reduce([String](), { result, element in
                var initial = [element.first!]
                var prevChar: Character = element.first!
                for char in element {
                    if "A"..."Z" ~= char && "a"..."z" ~= prevChar {
                        initial.append(char)
                    }
                    prevChar = char
                }
                return result + initial.map { String($0) }
            })
            .map { String($0.uppercased().first!) }
            .joined()
        
        return acronym
    }
}
