//  Created by Bahadir Etka Kilinc


enum TranscriptionError: Error{
    case invalidNucleotide(message: String)
}
struct Nucleotide{
    
    var lineUp = ""
    
    func complementOfDNA() throws -> String{
        var complement = ""
        for letter in lineUp{
            switch letter{
            case "G":
                complement.append("C")
            case "C":
                complement.append("G")
            case "T":
                complement.append("A")
            case "A":
                complement.append("U")
            default:
                throw TranscriptionError.invalidNucleotide(message: "\(letter) is not a valid Nucleotide")
            }
        }
        return complement
    }
    
    init(_ lineUp: String){
        self.lineUp = lineUp
    }
}