//  Created by Bahadir Etka Kilinc


class Gigasecond {
    let gigaSecond = 1000000000
    let description: String // default Date.description not working because of test
    init?(from dateString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.date(from: dateString){
            let gigasecondDate = Date(timeInterval: TimeInterval(gigaSecond), since: date)
            description = dateFormatter.string(from: gigasecondDate)
        }else{
            return nil
        }
    }
}
