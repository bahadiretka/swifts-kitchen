//  Created by Bahadir Etka Kilinc

struct NumberSeries{
    let input: String
    
    enum NumberSeriesError: Error{
        case spanLongerThanStringLength
        case invalidCharacter
        case negativeSpan
    }
    
    init(_ input: String){
        self.input = input
    }
    func largestProduct(_ numberOfDigit: Int) throws -> Int{
        guard numberOfDigit >= 0 else{ throw NumberSeriesError.negativeSpan}
        guard input.count >= numberOfDigit else {throw NumberSeriesError.spanLongerThanStringLength}
        
        var digitSeries = [Int]()
        for char in input{
            guard let number = char.wholeNumberValue else {throw NumberSeriesError.invalidCharacter}
            digitSeries.append(number)
        }
        var max = 0
        for i in 0...digitSeries.count - numberOfDigit{
            let initialSerie = digitSeries[i..<i+numberOfDigit]
            let product = initialSerie.reduce(into: 1) { partialResult, num in
                return partialResult *= num
            }
            if product > max{
                max = product
            }
        }
        return max
    }
}
