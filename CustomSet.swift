//  Created by Bahadir Etka Kilinc

import Foundation
class CustomSet<T: Comparable> :Equatable{
    var set: [T]
    var size: Int{
        get{
            return set.count
        }
    }
    var toSortedArray: [T]{
        get{
            return set
        }
    }
    init(_ list: [T]){
        set = [T]()
        list.forEach { element in
            if !set.contains(element){
                set.append(element)
            }
        }
        set = set.sorted(by: <)
    }
    func delete(_ value: T){
        for (index,element) in set.enumerated(){
            if element == value{
                set.remove(at: index)
            }
        }
    }
    func difference(_ otherSet: CustomSet<T>) -> CustomSet<T>{
        return CustomSet(set.filter{!otherSet.containsMember($0)})
    }
    func removeAll(){
        set.removeAll()
    }
    func isDisjoint(_ otherSet: CustomSet<T>) -> Bool{
        for first in set{
            for second in otherSet.set{
                if first == second{
                    return false
                }
            }
        }
        return true
    }
    func containsMember(_ value: T) -> Bool{
        return set.contains(value)
    }
    func intersection(_ otherSet: CustomSet<T>) -> CustomSet<T>{
        return CustomSet(set.filter{otherSet.containsMember($0)})
    }
    func put(_ element: T){
        if !set.contains(element){
            set.append(element)
        }
        set = set.sorted(by: <)
    }
    func isSupersetOf(_ otherSet: CustomSet<T>) -> Bool{
        for element in otherSet.set{
            if !containsMember(element){
                return false
            }
        }
        return true
    }
    func union(_ otherSet: CustomSet<T>) -> CustomSet<T>{
        return CustomSet(set + otherSet.set)
    }
    static func == (lhs: CustomSet<T>, rhs: CustomSet<T>) -> Bool {
        return lhs.set == rhs.set
    }
}