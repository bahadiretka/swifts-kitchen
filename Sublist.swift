//  Created by Bahadir Etka Kilinc

extension Array where Element: Equatable{
    func isSubList(of other:[Element]) -> Bool{
        let lenOne = self.count
        let lenTwo = other.count
        
        if lenOne > lenTwo { return false }
        for i in 0...(lenTwo-lenOne) {
            if self[...] == other[i ..< (i+lenOne)] {
                return true
            }
        }
        return false
    }
}

enum Classification{
    case equal
    case sublist
    case superlist
    case unequal
}

func classifier<T>(listOne: [T], listTwo: [T]) -> Classification where T: Equatable{
    
    if listOne.elementsEqual(listTwo){
        return .equal
    }else if listOne.isSubList(of: listTwo){
        return .sublist
    }else if listTwo.isSubList(of: listOne){
        return .superlist
    }else{
        return .unequal
    }
}
