//  Created by Bahadir Etka Kilinc

func remainingMinutesInOven(elapsedMinutes: Int) -> Int{
    return 40 - elapsedMinutes
}
func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int{
    return expectedMinutesInOven - elapsedMinutes
}
func preparationTimeInMinutes(layers: String...) -> Int{
    return layers.count * 2
}
func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
    let sauceNumber = layers.filter { $0 == "sauce"}.count
    let noodleNumber = layers.filter {$0 == "noodles"}.count
    return (noodles: noodleNumber * 3,sauce: Double(sauceNumber) * 0.2)
}
func toOz(_ amount: inout (noodles: Int, sauce: Double)){
    amount.sauce *= 33.814
}
func redWine(layers: String...) -> Bool{
    func mozzarella(_ layer: [String]) -> Int{
        return layer.filter{$0 == "mozzarella"}.count
    }
    func ricotta(_ layer: [String]) -> Int{
        return layer.filter{$0 == "ricotta"}.count
    }
    func béchamel(_ layer: [String]) -> Int{
        return layer.filter{$0 == "béchamel"}.count
    }
    func sauce(_ layer: [String]) -> Int{
        return layer.filter{$0 == "sauce"}.count
    }
    func meat(_ layer: [String]) -> Int{
        return layer.filter{$0 == "meat"}.count
    }
    return meat(layers) + sauce(layers) >=
            mozzarella(layers) + béchamel(layers) + ricotta(layers)
}