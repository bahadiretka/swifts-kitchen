//  Created by Bahadir Etka Kilinc

enum CircularBufferError: Error{
    case bufferFull
    case bufferEmpty
}
struct CircularBuffer<T>{
    var buffer: [T]
    var capacity: Int
    var start: Int
    var end: Int
    var numberOfElements = 0
    mutating func write(_ input: T) throws{
        if buffer.count >= capacity {
            throw CircularBufferError.bufferFull
        }
        buffer.append(input)
    }
    mutating func overwrite(_ input: T){
        if buffer.count >= capacity {
            buffer.removeFirst()
        }
        buffer.append(input)
    }
    mutating func read() throws -> T?{
        if buffer.count == 0{
            throw CircularBufferError.bufferEmpty
        }
        return buffer.removeFirst()
    }
    mutating func clear(){
        buffer.removeAll(keepingCapacity: true)
    }
    init(capacity: Int){
        self.capacity = capacity
        buffer = [T]()
    }
    func isEmpty() -> Bool{
        return buffer.isEmpty
    }
}