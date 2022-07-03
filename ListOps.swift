//  Created by Bahadir Etka Kilinc


struct ListOps<T>{
    
    static func append(_ firstList: Array<T>,_ secondList: Array<T>) -> Array<T>{
        var resultList = Array<T>()
        resultList.append(contentsOf: firstList)
        resultList.append(contentsOf: secondList)
        return resultList
    }
    static func concat(_ lists: Array<T>...) -> Array<T>{
        var resultList = Array<T>()
        for list in lists{
            resultList.append(contentsOf: list)
        }
        return resultList
    }
    static func filter(_ list: Array<T>,_ foo: (T) -> Bool) -> Array<T>{
        var resultList = Array<T>()
        resultList.append(contentsOf: list)
        var currentIndex = 0
        for element in list{
            if !foo(element){
                resultList.remove(at: currentIndex)
                currentIndex -= 1
            }
            currentIndex += 1
        }
        return resultList
    }
    static func length(_ list: Array<T>) -> Int{
        return list.count
    }
    static func map(_ list: Array<T>,_ foo: (T) -> T) -> Array<T>{
        var resultList = Array<T>()
        for element in list{
            let newValue = foo(element)
            resultList.append(newValue)
        }
        return resultList
    }
    static func foldLeft(_ list: Array<T>, accumulated: T, combine operation: (T,T) -> T) -> T{
        
        if !list.isEmpty{
            var result = list.last
            for i in (0...list.endIndex-2).reversed(){
                result = operation(result!, list[i])
            }
            return operation(accumulated,result!)
        }
        return accumulated
    }
    static func foldRight(_ list: Array<T>, accumulated: T,combine operation: (T,T) -> T) -> T{
        
        if !list.isEmpty{
            var result = list.first
            for i in 1..<list.endIndex{
                result = operation(result!, list[i])
            }
            return operation(result!,accumulated)
        }
        return accumulated
    }
    static func reverse(_ list: Array<T>) -> Array<T>{
        return list.reversed()
    }
}