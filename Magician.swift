//  Created by Bahadir Etka Kilinc


func getCard(at index: Int, from stack: [Int]) -> Int {
    if index < 0 || index >= stack.count{
        return -1
    }
      return stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
    if index < 0 || index >= stack.count{
        return stack
    }
    var newStack = stack
    newStack[index] = newCard
    return newStack
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
      var newStack = stack
    newStack.append(newCard)
    return newStack
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
    if index < 0 || index >= stack.count{
        return stack
    }else{
        var newStack = stack
        newStack.remove(at: index)
        return newStack
    }
}

func removeTopCard(_ stack: [Int]) -> [Int] {
    if stack.isEmpty{
        return stack
    }else{
        var newStack = stack
        newStack.removeLast()
        return newStack
    }
}

func insert(_ newCard: Int, atBottomOf stack: [Int]) -> [Int] {
    var newStack = stack
    newStack.insert(newCard, at: 0)
    return newStack
}

func removeBottomCard(_ stack: [Int]) -> [Int] {
    if stack.isEmpty{
        return stack
    }else{
        var newStack = stack
        newStack.removeFirst()
        return newStack
    }
}
func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
    return stack.count == size
}

func evenCardCount(_ stack: [Int]) -> Int {
    var counter = 0
    for number in stack{
        if number.isMultiple(of: 2){
            counter += 1
        }
    }
    return counter
}
