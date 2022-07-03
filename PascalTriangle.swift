//  Created by Bahadir Etka Kilinc

struct PascalsTriangle {
    var step: Int
    init(_ step: Int) {
        self.step = step
    }
    var rows: [[Int]] {
        var triangle = [[Int]]()
        guard step > 0 else { return []}
        for i in 0..<step {
            var row = [1]
            for j in 0..<i {
                row.append((row[j] * (i - j)) / (j + 1))
            }
            triangle.append(row)
        }
        return triangle
    }
}
