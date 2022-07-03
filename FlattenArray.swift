//  Created by Bahadir Etka Kilinc

func flattenArray<T>(_ input: [Any?]) -> [T] {
    
    var flattenedArray = [T]()
    for element in input {
        if let nestedArray = element as? [Any?] {
            flattenedArray += flattenArray(nestedArray)
        } else if let safe = element as? T {
            flattenedArray.append(safe)
        }
    }
    return flattenedArray
}