//  Created by Bahadir Etka Kilinc

class Clock{
    let oneDayInMinute = 1440
    var hour = 0
    var minute = 0
    init(hours: Int){
        setHourAndMinute(hours, 0)
    }
    init(hours: Int, minutes: Int){
        setHourAndMinute(hours, minutes)
    }
    func add(minutes: Int) -> Clock{
        let totalMinutes = hour * 60 + minute + minutes
        setHourAndMinute(0, totalMinutes)
        return self
    }
    func subtract(minutes: Int) -> Clock{
        let totalMinutes = hour * 60 + minute - minutes
        setHourAndMinute(0, totalMinutes)
        return self
    }
    func setHourAndMinute(_ hours: Int,_ minutes: Int){
        var pozitivedMinute = hours * 60 + minutes
        if pozitivedMinute < 0{
            pozitivedMinute = pozitivedMinute % oneDayInMinute + oneDayInMinute
        }
        minute = pozitivedMinute % 60
        hour = pozitivedMinute / 60
        hour %= 24
    }
}
extension Clock: Equatable{
    static func == (lhs: Clock, rhs: Clock) -> Bool {
        lhs.description == rhs.description
    }
}
extension Clock: CustomStringConvertible{
    var description: String{
        get{
            var result = ""
            if(hour / 10 == 0){
                result += "0\(hour)"
            }else {
                result += "\(hour)"
            }
            if minute / 10 == 0{
                result += ":0\(minute)"
            }else{
                result += ":\(minute)"
            }
            return result
        }
    }
}