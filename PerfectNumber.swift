//  Created by Bahadir Etka Kilinc

enum Nicomachus{
    case perfect
    case abundant
    case deficient
}
struct NumberClassifier{
    var classification: Nicomachus
    init(number: Int){
        var divisors = [Int]()
        for i in 1..<number{
            if number % i == 0{
                divisors.append(i)
            }
        }
        var sum = 0
        for element in divisors{
            sum += element
        }
        if sum == number{
            classification = .perfect
        }else if sum > number{
            classification = .abundant
        }else{
            classification = .deficient
        }
    }
}