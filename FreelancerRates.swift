//  Created by Bahadir Etka Kilinc

func dailyRateFrom(hourlyRate: Int) -> Double {
  return Double(hourlyRate) * 8.0
}
func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
    var mountlyRate = Double(22 * 8 * hourlyRate)
    mountlyRate -= mountlyRate * discount / 100.0
    return mountlyRate.rounded(.toNearestOrAwayFromZero)
}
func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
    let countedBudget = budget + budget * discount / 100.0 
    let workDay = countedBudget / Double(hourlyRate * 8)
    return workDay.rounded(.toNearestOrAwayFromZero)
}
