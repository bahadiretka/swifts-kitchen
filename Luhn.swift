//  Created by Bahadir Etka Kilinc

struct Luhn{
    let digits = "0123456789"
    let input: String
    init(_ input: String){
        self.input = input
    }
    var isValid: Bool{
        get{
            for ch in input{ if !digits.contains(ch) && ch != " " { return false} }
            let intArray = input.filter{digits.contains($0)}.map{Int($0.wholeNumberValue!)}.reversed()
            guard intArray.count > 1 else {return false}
            var luhnArray = [Int]()
            for (i,val) in intArray.enumerated(){
                if i % 2 == 0{
                    luhnArray.append(val)
                }else{
                    let dVal = val * 2
                    luhnArray.append(dVal > 9 ? dVal - 9 : dVal)
                }
            }
            return luhnArray.reduce(0){$0+$1}.isMultiple(of: 10)
        }
    }
}