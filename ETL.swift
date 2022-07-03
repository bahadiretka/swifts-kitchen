//  Created by Bahadir Etka Kilinc


struct ETL{
    static func transform(_ old: [Int: [String]]) -> [String : Int]{
        var newDic: [String : Int] = [:]
        for (point,letters) in old{
            for letter in letters{
                newDic[letter.lowercased()] = point
            }
        }
        return newDic
    }
}