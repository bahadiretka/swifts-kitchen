//  Created by Bahadir Etka Kilinc


enum BinarySearchError: Error{
    case unsorted
}

struct BinarySearch{
    
    var list = [Int]()
    var middle: Int{
        return (list.startIndex - 1 + list.endIndex) / 2
    }
    
    init(_ input: [Int]) throws{
        list = input.sorted(by: <)
        guard list == input else{throw BinarySearchError.unsorted}
    }
    
    func searchFor(_ number: Int) -> Int?{
        var startIndex = 0
        var endIndex = list.endIndex - 1
        var currentMiddle = middle
        while !(currentMiddle == startIndex || currentMiddle == endIndex) {
            if number > list[currentMiddle]{
                startIndex = currentMiddle
            }else if number < list[currentMiddle]{
                endIndex = currentMiddle
            }else{
                return currentMiddle
            }
            currentMiddle = (endIndex + startIndex) / 2
        }
        return nil
    }
}