//  Created by Bahadir Etka Kilinc

let numeralsDict = [
        "ones":     ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
        "tens":     ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
        "hundreds": ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
        "thousands" : ["", "M", "MM", "MMM"],
    ]
func RomanNumeral(_ input: Int) -> String{
    var number = input
    var result = [String]()
    for index in ["ones", "tens", "hundreds", "thousands"]{
        if let str = numeralsDict[index]{
            result.insert(str[number % 10], at: 0)
        }
        number /= 10
    }
    return result.joined()
}