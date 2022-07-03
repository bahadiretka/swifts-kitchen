//  Created by Bahadir Etka Kilinc

class BinarySearchTree<T: Comparable>{
    var data: T
    var left,right: BinarySearchTree<T>?
    
    init(_ rootData: T){
        data = rootData
        left = nil
        right = nil
    }
    func insert(_ newElement: T){
        if newElement <= data{
            if let left = left{
                left.insert(newElement)
            }else{
                left = BinarySearchTree(newElement)
            }
        }else{
            if let right = right {
                right.insert(newElement)
            }else{
                right = BinarySearchTree(newElement)
            }
        }
    }
    func allData() -> [T]{
        var result = [T]()
        if let left = left {
            result += left.allData()
        }
        result += [data]
        if let right = right {
            result += right.allData()
        }
        return result
    }
}