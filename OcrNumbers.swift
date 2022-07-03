//  Created by Bahadir Etka Kilinc
extension String{
    func split(with seperator: String = "-",by number: Int) -> String{
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
struct OCR {
    enum OCRError : Error {
        case invalidNumberOfLines, invalidNumberOfColumns
    }
    let ocrDict = [
        " _ " +
        "| |" +
        "|_|" +
        "   ": "0",
        "   " +
        "  |" +
        "  |" +
        "   ": "1",
        " _ " +
        " _|" +
        "|_ " +
        "   " : "2",
        " _ " +
        " _|" +
        " _|" +
        "   ": "3",
        "   " +
        "|_|" +
        "  |" +
        "   " : "4",
        " _ " +
        "|_ " +
        " _|" +
        "   ": "5",
        " _ " +
        "|_ " +
        "|_|" +
        "   ":"6",
        " _ " +
        "  |" +
        "  |" +
        "   ":"7",
        " _ " +
        "|_|" +
        "|_|" +
        "   ":"8",
        " _ " +
        "|_|" +
        " _|" +
        "   ":"9"
    ]
    var convertedString: String
    init(_ input: String) throws{
        let check = input.split(separator: "\n")
        guard check.count.isMultiple(of: 4) else { throw OCRError.invalidNumberOfLines }
        guard check[0].count.isMultiple(of: 3) else { throw OCRError.invalidNumberOfColumns }
        
        let len = check[0].count
        let lines = check.joined().split(by: 3).split(separator: "-").map{String($0)}
        var result = ""
        for index in stride(from: 0, through: lines.count-1, by: len / 3 * 4){
            for i in index..<(len/3) + index{
                var str = ""
                for j in 0..<4{
                    str += lines[i + (j * len / 3)]
                }
                result += ocrDict[str,default: "?"]
            }
            result += ","
        }
        result.removeLast()
        convertedString = result
    }
    func converted() throws -> String {
        return convertedString
    }
}