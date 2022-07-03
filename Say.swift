//  Created by Bahadir Etka Kilinc

extension Int {
  var asWord: String? {
    let numberValue = NSNumber(value: self)
    let formatter = NumberFormatter()
      formatter.numberStyle = .spellOut
    return formatter.string(from: numberValue)
  }
}
struct Say{
    static func say(_ number: Int) -> String?{
        if number < 0{
            return nil
        }
        return number.asWord
    }
}
