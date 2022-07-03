//  Created by Bahadir Etka Kilinc

func cartesianToPolar(_ cart: (x: Double, y: Double)) -> (r: Double, phi: Double) {
    return (r: sqrt(pow(cart.x,2) + pow(cart.y, 2)), phi: atan2(cart.y, cart.x))
}

func combineRecords(
  production: (toy: String, id: Int, productLead: String),
  gifts: (Int, [String])
) -> (id: Int, toy: String, productLead: String, recipients: [String]) {
    return (id: production.id, toy: production.toy, productLead: production.productLead, recipients: gifts.1)
}