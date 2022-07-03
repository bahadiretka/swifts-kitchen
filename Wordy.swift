//  Created by Bahadir Etka Kilinc

import Foundation
struct WordProblem{
    enum WordProblemError: Error{
        case invalidQuestion
        case invalidNumber
    }
    var question: String
    init(_ question: String){
        self.question = question
    }
    func answer() throws -> Int{
        let components = question.dropLast().components(separatedBy: " ").filter{!["What","is","by"].contains($0)}
        guard components.count >= 3 else{throw WordProblemError.invalidQuestion}
        var numbers = [Int]()
        var operations = [((Int,Int) -> Int)]()
        for component in components{
                if let num = Int(component){
                    numbers.append(num)
                }else{
                    switch component{
                    case "divided":
                        operations.append(/)
                    case "multiplied":
                        operations.append(*)
                    case "plus":
                        operations.append(+)
                    case "minus":
                        operations.append(-)
                    default:  ()
                   
                    }
                }
        }
        guard numbers.count >= 2 else{throw WordProblemError.invalidNumber }
        for _ in 0..<numbers.count-1{
            let operation = operations.removeFirst()
            let firstTwo = numbers[0...1]
            let operationResult = operation(firstTwo[0],firstTwo[1])
            numbers = [Int](numbers.dropFirst(2))
            numbers.insert(operationResult, at: 0)
        }
        return numbers.first!
    }
}