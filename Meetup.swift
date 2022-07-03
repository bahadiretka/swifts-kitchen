//  Created by Bahadir Etka Kilinc


extension Date{
    func nextWeekDay(after date: Date, day: Int, nth: Int) -> Date{
        var current = date
        var to = nth
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: date)
        
        if components.weekday! == day{ to -= 1 }
        for _ in 0..<to{
            current = Calendar.current.nextDate(after: current, matching: DateComponents(weekday: day), matchingPolicy: .nextTime)!
        }
        return current
    }
    func lastNthDayOf(date: Date, day: Int) -> Date{
        var current = date
        var last: Date!
        while Calendar.current.isDate(current, equalTo: date, toGranularity: .month) {
            last = current
            current = Calendar.current.nextDate(after: current, matching: DateComponents(weekday: day), matchingPolicy: .nextTime)!
        }
        return last
    }
    func teethDay(date: Date, day: Int) -> Date{
        var current = date
        let calendar = Calendar.current
        var components = calendar.dateComponents([.day], from: current)
        while !(13...19).contains(components.day!){
            current = Calendar.current.nextDate(after: current, matching: DateComponents(weekday: day), matchingPolicy: .nextTime)!
            components = calendar.dateComponents([.day], from: current)
        }
        return current
    }
}
struct Meetup {
    let year: Int
    let month: Int
    func day(_ weekDay: Int, which: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var date = dateFormatter.date(from: "\(year)-\(String(format: "%02d", month))-\(String(format: "%02d", 1))")
        switch which {
        case "1st":
            date = date?.nextWeekDay(after: date!, day: weekDay, nth: 1)
        case "2nd":
            date = date?.nextWeekDay(after: date!, day: weekDay, nth: 2)
        case "3rd":
            date = date?.nextWeekDay(after: date!, day: weekDay, nth: 3)
        case "4th":
            date = date?.nextWeekDay(after: date!, day: weekDay, nth: 4)
        case "last":
            date = date?.lastNthDayOf(date: date!, day: weekDay)
        case "teenth":
            date = date?.teethDay(date: date!, day: weekDay)
        default:
            break
        }
        return dateFormatter.string(from: date!)
    }
}