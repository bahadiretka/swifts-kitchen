//  Created by Bahadir Etka Kilinc

struct TwelveDaysSong{
    static let start = "On the twelfth day of Christmas my true love gave to me:"
    static let days = [1:"first",2:"second",3:"third",4:"fourth",5:"fifth",6:"sixth",7:"seventh",8:"eighth",9:"ninth",10:"tenth",11:"eleventh",12:"twelfth"]
    static let text = " twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.".split(separator: ",").map{String($0)}

    static var daySing: [String]{
        var result = [String]()
        for i in 0..<text.count{
            if i == text.count - 1{
                result.append("On the \(days[12-i]!) day of Christmas my true love gave to me:" + " a Partridge in a Pear Tree.")
            }else{
                result.append("On the \(days[12-i]!) day of Christmas my true love gave to me:" + Array(text[i..<text.count]).joined(separator: ","))
            }
        }
        return result.reversed()
    }
    
    static func verse(_ verse: Int) -> String{
        return daySing[verse-1]
    }
    static func verses(_ start: Int, _ end: Int) -> String{
        return daySing[start-1..<end].joined(separator: "\n")
    }
    static func sing() -> String{
        return daySing.joined(separator: "\n")
    }
}