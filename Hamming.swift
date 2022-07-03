//  Created by Bahadir Etka Kilinc


struct Hamming{
    static func compute(_ first: String, against: String) -> Int?{
        
        if first.count != against.count{
            return nil
        }
        let zipped = zip(first,against).filter{$0 != $1}
        return zipped.count
    }
}