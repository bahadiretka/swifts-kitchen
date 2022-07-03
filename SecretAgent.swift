//  Created by Bahadir Etka Kilinc


func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
    func secretFunc (_ secretPass: String) -> String{
        if secretPass == password{
            return secret
        }else{
            return "Sorry. No hidden secrets here."
        }
    }
    return secretFunc(_:)
}
func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {
    let first = f(room)
    let second = f(first)
    let third = f(second)
    return (first,second,third)
}
