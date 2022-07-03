//  Created by Bahadir Etka Kilinc

class Element<T> {
    var value: T?
    var next: Element?
    init(_ value: T? = nil,_ next: Element? = nil) {
        self.value = value
        self.next = next
    }
    static func fromArray(_ list :[T]) -> Element<T> {
        var head: Element<T>?
        var next: Element<T>?
        for value in list.reversed() {
            head =  Element(value, next)
            next = head
        }
        if let head = head {
            return head
        }
        return Element<T>()
    }
    func toArray() -> [T] {
        if let value = self.value {
            let list = [value]
            if let next = self.next {
                return list + next.toArray()
            }
            return list
        }
        return []
    }
    func reverseElements() -> Element<T> {
        return Element.fromArray(self.toArray().reversed())
    }
    
}
