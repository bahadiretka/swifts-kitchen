//  Created by Bahadir Etka Kilinc

extension Array where Element:Equatable{
    func keep(foo :(Element) -> Bool) -> [Element]{
        var newCollection = [Element]()
        for element in self{
            if foo(element){
                newCollection.append(element)
            }
        }
        return newCollection
    }
    func discard(foo: (Element) -> Bool) -> [Element]{
        var newCollection = [Element]()
        for element in self{
            if !foo(element){
                newCollection.append(element)
            }
        }
        return newCollection
    }
}
