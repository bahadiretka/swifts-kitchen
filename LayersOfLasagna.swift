//  Created by Bahadir Etka Kilinc


let expectedMinutesInOven = 40
func remainingMinutesInOven(elapsedMinutes: Int) -> Int {
    return expectedMinutesInOven - elapsedMinutes
}
func preparationTimeInMinutes(layers: Int) -> Int{
    return layers * 2
}
func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int{
    return preparationTimeInMinutes(layers: layers) + elapsedMinutes
}
