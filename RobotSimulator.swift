//  Created by Bahadir Etka Kilinc

enum Directions{
    case north
    case east
    case south
    case west
}
enum Instructions: Character{
    case turnRight = "R"
    case turnLeft = "L"
    case advance = "A"
}

struct SimulatedRobot{
    
    var bearing: Directions = .west
    var coordinates = [0,0]
    mutating func orient(_ direction: Directions){
        bearing = direction
    }
    
    mutating func turnLeft(){
        switch bearing {
        case .north: orient(.west)
        case .east: orient(.north)
        case .south: orient(.east)
        case .west: orient(.south)
        }
    }
    mutating func turnRight(){
        switch bearing {
        case .north: orient(.east)
        case .east: orient(.south)
        case .south: orient(.west)
        case .west: orient(.north)
        }
    }
    mutating func advance(){
        switch bearing {
        case .north: coordinates[1] += 1
        case .east: coordinates[0] += 1
        case .south: coordinates[1] += -1
        case .west: coordinates[0] += -1
        }
    }
    mutating func at(x: Int, y: Int){
        coordinates[0] = x
        coordinates[1] = y
    }
    func instructions(_ input: String) -> [Instructions]{
        return input.compactMap { instruction in
            Instructions(rawValue: instruction)
        }
    }
    mutating func place(x: Int, y: Int, direction: Directions){
        at(x: x, y: y)
        orient(direction)
    }
    mutating func evaluate(_ input: String){
        let instructions = instructions(input)
        for instruction in instructions{
            switch instruction{
            case .turnLeft: turnLeft()
            case .turnRight: turnRight()
            case .advance: advance()
            }
        }
    }
}
