//  Created by Bahadir Etka Kilinc

struct DNA{
    
    var chain = ["A": 0, "T": 0, "C": 0, "G": 0]
    init?(strand: String){
        for nuc in strand{
            guard nuc == "A" || nuc == "T" || nuc == "C" || nuc == "G" else {return nil}
            chain.updateValue(chain["\(nuc)"]! + 1, forKey: "\(nuc)")
        }
    }
    
    func counts() -> [String:Int]{
        return chain
    }
    func count(_ nucleotide: String) -> Int{
        return chain[nucleotide]!
    }
}