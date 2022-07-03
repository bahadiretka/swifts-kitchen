//  Created by Bahadir Etka Kilinc


func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
    
    let frugalBudget = monthlyBudget + monthlyBudget / 10
    let mountlyPayment = price / 60 // five year
    
    if mountlyPayment < monthlyBudget{ // easy
        return "Yes! I'm getting a \(vehicle)"
    }else if mountlyPayment < frugalBudget { // should be fragal
        return "I'll have to be frugal if I want a \(vehicle)"
    }else{
        return "Darn! No \(vehicle) for me"
    }
}
func licenseType(numberOfWheels wheels: Int) -> String {
    switch wheels{
    case 2,3:
       return "You will need a motorcycle license for your vehicle"
    case 4,6:
        return "You will need an automobile license for your vehicle"
    case 18:
        return "You will need a commercial trucking license for your vehicle"
    default:
        return "We do not issue licenses for those types of vehicles"
    }
}
func registrationFee(msrp: Int, yearsOld: Int) -> Int {
    
    if yearsOld >= 10{
        return 25 // 10 or older
    }else{
        let base: Double = msrp > 25000 ? Double(msrp) : 25000.0
        var computed = base
        for _ in 0..<yearsOld{
            computed -= base / 10
        }
        computed /= 100
        return Int(computed.rounded(.towardZero))
    }
    
}
