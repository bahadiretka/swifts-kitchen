//  Created by Bahadir Etka Kilinc

struct PrimeFactors{
    var toArray: [Int]
    init(_ input: Int){
        var number = input
        var primeFactors = [Int]()
        var initial = 2
        while number > 1{
            if number % initial == 0{
                primeFactors.append(initial)
                number /= initial
            }else{
                initial += 1
            }
            
        }
        toArray = primeFactors
    }
}
