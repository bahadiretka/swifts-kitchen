//  Created by Bahadir Etka Kilinc

class Node<T>{
    var data: T
    var prev,next: Node<T>?
    init(_ value: T){
        data = value
        self.prev = nil
        self.next = nil
    }
}
class Deque<T>{
    var head,tail: Node<T>?
    func push(_ element: T){
        if let tail = tail { 
            tail.next = Node(element)
            tail.next?.prev = tail
            self.tail = tail.next
        }else{
            head = Node(element)
            tail = head
        }
    }
    func pop() -> T?{
        guard let tail = tail else { return nil }
        let data = tail.data
        tail.prev?.next = nil
        self.tail = tail.prev
        return data
    }
    func shift() -> T?{
        guard let head = head else { return nil }
        let data = head.data
        head.next?.prev = nil
        self.head = head.next
        return data
    }
    func unshift(_ element: T){
        if let head = head {
            head.prev = Node(element)
            head.prev?.next = head
            self.head = head.prev
        }else{
            head = Node(element)
            tail = head
        }
    }
}