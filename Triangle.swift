//  Created by Bahadir Etka Kilinc

struct Triangle {
    var kind: String
    init(_ a: Double, _ b: Double, _ c: Double) {
        if max(a, b, c) >= (a + b + c) - max(a, b, c) {
            kind = "ErrorKind"
        } else if a == b && b == c {
            kind = "Equilateral"
        } else if a == b || b == c || c == a {
            kind = "Isosceles"
        } else {
            kind = "Scalene"
        }
    }
}
