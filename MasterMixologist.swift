//  Created by Bahadir Etka Kilinc

func timeToPrepare(drinks: [String]) -> Double {
    var total = 0.0
    for drink in drinks{
        switch drink{
        case "beer","soda","water":
            total += 0.5
        case "shot":
            total += 1.0
        case "mixed drink":
            total += 1.5
        case "fancy drink":
            total += 2.5
        case "frozen drink":
            total += 3.0
        default:
            ()
        }
    }
    return total
}

func makeWedges(needed: Int, limes: [String]) -> Int {
    var total = 0
    var rest = needed
    for lime in limes{
        if rest > 0 {
            switch lime{
            case "small":
                rest -= 6
            case "medium":
                rest -= 8
            case "large":
                rest -= 10
            default:
                ()
            }
            total += 1
        }
    }
    return total
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
    var remainingTime = Double(minutesLeft)
    var rest = remainingOrders
    for drinks in remainingOrders{
        let prepareTime = timeToPrepare(drinks: drinks)
        if remainingTime > 0{
            rest.removeFirst()
            remainingTime -= prepareTime
        }
    }
    return rest
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
  beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
) {
    var beerTimes = [String]()
    var sodaTimes = [String]()
    for drink in orders{
        switch drink.drink{
        case "beer":
            beerTimes.append(drink.time)
        case "soda":
            sodaTimes.append(drink.time)
        default:
            ()
        }
    }
    return (beer: !beerTimes.isEmpty ? (first: beerTimes.first!, last: beerTimes.last!, total: beerTimes.count) : nil,
            soda: !sodaTimes.isEmpty ? (first: sodaTimes.first!, last: sodaTimes.last!, total: sodaTimes.count) : nil)
}