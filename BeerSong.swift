//  Created by Bahadir Etka Kilinc



struct BeerSong{
    let bottleNumber: Int
    
    init(numberOfBeerBottles: Int){
        bottleNumber = numberOfBeerBottles
    }
    func generateVersesOfBeerSong() -> String{
        var countDown = bottleNumber
        var result = ""
        while countDown >= 0 {
        switch countDown {
            case 0:
            result = result + "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
            case 1:
            result = result + "1 bottle of beer on the wall, 1 bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall.\n\n"
            case 2:
            result = result + "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n\n"
            default:
            result = result + "\(countDown) bottles of beer on the wall, \(countDown) bottles of beer.\nTake one down and pass it around, \(countDown - 1) bottles of beer on the wall.\n\n"
            }
            countDown -= 1
        }
        return result
    }
}