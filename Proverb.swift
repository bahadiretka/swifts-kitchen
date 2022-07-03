//  Created by Bahadir Etka Kilinc


extension Array where Element == String{
    func recite() -> String{
        if self.count == 0{
            return ""
        }else{
            let last =  "And all for the want of a \(self[0])."
            var first = ""
            if self.count >= 2 {
                for i in 0...self.count-2{
                    first += "For want of a \(self[i]) the \(self[i+1]) was lost.\n"
                }
            }
            return first + last
        }
    }
}
