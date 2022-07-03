//  Created by Bahadir Etka Kilinc

class Bowling {
    enum BowlingError: Error {
        case invalidNumberOfPins
        case tooManyPinsInFrame
        case gameInProgress
        case gameIsOver
    }
    var frames = 0
    var isCompletedFrame = false
    var lastRoll = 0
    var totalScore = 0
    var bonusFrame = [0, 0]

    func roll(pins score: Int) throws {
        print(totalScore)
        guard score >= 0 && score <= 10 else{ throw BowlingError.invalidNumberOfPins }
        guard !isCompletedFrame || (lastRoll + score) <= 10 else { throw BowlingError.tooManyPinsInFrame }
        if frames == 10 && bonusFrame[0] == 0 {
            throw BowlingError.gameIsOver
        }
        if frames == 10 {
            if bonusFrame[0] != 0{
                totalScore += score * bonusFrame[0]
            }else{ return }
        } else {
            totalScore += score * (1 + bonusFrame[0])
        }
        bonusFrame = [bonusFrame[1], 0]

        if !isCompletedFrame && score == 10 && frames < 10 {
            bonusFrame[0] += 1
            bonusFrame[1] += 1
        }
        if isCompletedFrame && (lastRoll + score) == 10  && frames < 10 {
            bonusFrame[0] += 1
        }
        if isCompletedFrame {
            isCompletedFrame = false
        } else if score < 10 {
            isCompletedFrame = true
            lastRoll = score
        }
        if !isCompletedFrame && frames < 10 {
            frames += 1
        }
    }
    func score() throws -> Int {
        guard frames >= 10 && bonusFrame[0] == 0 else{ throw BowlingError.gameInProgress }
        return totalScore
    }
}