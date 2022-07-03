//  Created by Bahadir Etka Kilinc

enum TranslationError: Error {
    case invalidCodon
}
struct ProteinTranslation{
    static func translationOfCodon(_ codon: String) throws -> String {
        switch codon {
        case "AUG":         return "Methionine"
        case "UUU", "UUC":  return "Phenylalanine"
        case "UUA", "UUG":  return "Leucine"
        case "UCU", "UCC", "UCA", "UCG":
                            return "Serine"
        case "UAU", "UAC":  return "Tyrosine"
        case "UGU", "UGC":  return "Cysteine"
        case "UGG":         return "Tryptophan"
        case "UAA", "UAG", "UGA":
                            return "STOP"
        default:            throw TranslationError.invalidCodon
        }
    }
    static func translationOfRNA(_ rnaSequence: String) throws -> [String] {
        var proteins = [String]()
        var begin = rnaSequence.startIndex
        while begin < rnaSequence.endIndex {
            let end = rnaSequence.index(begin, offsetBy: 3)
            let codon = rnaSequence[begin..<end]
            let protein = try translationOfCodon(String(codon))
            
            if protein == "STOP" { break }
            proteins.append(protein)
            begin = end
        }
        return proteins
    }
}