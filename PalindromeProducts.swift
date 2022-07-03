//  Created by Bahadir Etka Kilinc

extension Int{
    func isPalindrom() -> Bool{
        var num = self
        var reversed = 0
        while num > 0{
            reversed *= 10
            reversed += num % 10
            num /= 10
        }
        return self == reversed
    }
}
struct PalindromeProducts{
    var largest: (value: Int, factor: [Int]){
        guard !palindroms.isEmpty else {return (value: 0, factor: [])}
        return (value: palindroms.last!.reduce(1){$0 * $1},
                factor: palindroms.last!)
    }
    var smallest: (value: Int, factor: [Int]){
        guard !palindroms.isEmpty else {return (value: 0, factor: [])}
        return (value: palindroms[0].reduce(1){$0 * $1},
                factor: palindroms[0])
    }
    var palindroms: [[Int]]
    init(maxFactor: Int, minFactor: Int = 1){
        palindroms = [[Int]]()
        for i in minFactor...maxFactor{
            for j in i...maxFactor{
                if (i * j).isPalindrom(){
                    palindroms += [[i,j]]
                }
            }
        }
        palindroms = palindroms.sorted(by: {$0.reduce(1){$0 * $1} < $1.reduce(1){$0 * $1}})
    }
}