//  Created by Bahadir Etka Kilinc


extension Array where Element: Any {
    func accumulate(_ foo: (Element) -> Element) -> [Element]{
        var newCollection = [Element]()
        for i in self{
            let newString = foo(i)
            newCollection.append(newString)
        }
        return newCollection
    }
    func accumulate(_ foo: (Element) -> [Element]) -> [[Element]]{
        var newCollection = [[Element]]()
        for i in self{
            let newString = foo(i)
            newCollection.append(newString)
        }
        return newCollection
    }
    
}