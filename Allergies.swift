//  Created by Bahadir Etka Kilinc

enum Allergens: UInt,CaseIterable{
    case eggs = 1
    case peanuts = 2
    case shellfish = 4
    case strawberries = 8
    case tomatoes = 16
    case chocolate = 32
    case pollen = 64
    case cats = 128
}
struct Allergies{
    
    let score: UInt
    var allergies = [Allergens]()
    init(_ score: UInt){
        self.score = score
        detectAllergies()
    }
    mutating func detectAllergies(){
        Allergens.allCases.forEach { point in
            if score & point.rawValue > 0{
                allergies.append(point)
            }
        }
    }
    func hasAllergy(_ allergy: Allergens) -> Bool{
        return allergies.contains(allergy)
    }
}

