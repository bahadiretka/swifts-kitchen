//  Created by Bahadir Etka Kilinc

struct Triplet{
    var a,b,c : Int
    var sum: Int{
        return Int(a + b + c)
    }
    var product: Int{
        return Int(a * b * c)
    }
    var isPythagorean: Bool{
        return pow(Double(c),2) == pow(Double(a), 2) + pow(Double(b), 2)
    }
    init(_ a: Int, _ b: Int, _ c: Int){
        self.a = a
        self.b = b
        self.c = c
    }
    static func fromWhere(_ from: Int = 1, maxFactor: Int) -> [Triplet]{
        var triplets = [Triplet]()
        for i in from...maxFactor{
            for j in i...maxFactor{
                for k in j...maxFactor{
                    if pow(Double(k), 2) == pow(Double(j), 2) + pow(Double(i), 2){
                        triplets.append(Triplet(i,j,k))
                    }
                }
            }
        }
        return triplets
    }
    static func fromWhere(maxFactor: Int, sum: Int) -> [Triplet]{
        return fromWhere(maxFactor: maxFactor).filter{$0.sum == sum}
    }
}