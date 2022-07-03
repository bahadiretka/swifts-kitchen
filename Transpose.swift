//  Created by Bahadir Etka Kilinc
import Foundation

extension String{
    func at(_ index: Int) -> Character?{
        for (i,ch) in self.enumerated(){
            if i == index {return ch}
        }
        return nil
    }
    func trimingTrailingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        guard let index = lastIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: characterSet) }) else { return ""}
        return String(self[...index])
    }
}
struct Transpose{
    static func transpose(_ input: [String]) -> [String]{
        guard !input.isEmpty else {return []}
        let maxOne = input.max{$1.count > $0.count}
        var result = [String]()
        for row in 0..<maxOne!.count{
            var line = ""
            for column in 0..<input.count{
                line.append(input[column].at(row) ?? " ")
            }
            line = line.trimingTrailingSpaces()
            result += [line]
        }
        return result
    }
}