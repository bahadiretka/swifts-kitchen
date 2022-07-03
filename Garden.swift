//  Created by Bahadir Etka Kilinc

enum Cup: Character {
    case grass = "G"
    case clover = "C"
    case radishes = "R"
    case violets = "V"
}
struct Garden {
    let cups: [[Cup]]
    let childrens: [String]
    
    init(_ diagram: String, children: [String] = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]) {
        let cupRows = diagram.split(separator: "\n")
        guard cupRows.count == 2,
            cupRows[0].count == cupRows[1].count
        else { fatalError("Diagram is not valid") }
        cups = cupRows.map { $0.map { Cup(rawValue: $0)! } }
        childrens = children.sorted()
    }
    
    func plantsForChild(_ child: String) -> [Cup] {
        guard let index = childrens.firstIndex(of: child) else { return [] }
        return cups.flatMap { $0.dropFirst(2*index).prefix(2) }
    }
}
