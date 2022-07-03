//  Created by Bahadir Etka Kilinc

import Foundation

struct TeamInfo: CustomStringConvertible{
    var wonMatches: Int = 0
    var lostMatches: Int = 0
    var drawnMatches: Int = 0
    var totalPoints: Int{
         wonMatches * 3 + drawnMatches
    }
    var playedMatches: Int{
        wonMatches + lostMatches + drawnMatches
    }
    mutating func wonGame(){ wonMatches += 1}
    mutating func lostGame(){ lostMatches += 1 }
    mutating func drawnGame(){ drawnMatches += 1}
    var description: String{
        return "|  \(playedMatches) |  \(wonMatches) |  \(drawnMatches) |  \(lostMatches) |  \(totalPoints)"
    }
}
struct Tournament{
    var teams = [String: TeamInfo]()
    mutating func tally(_ input: String) -> String{
        let firstLine = "Team                           | MP |  W |  D |  L |  P"
        guard !input.isEmpty else{return firstLine}
        let matches = input.components(separatedBy: "\n")
        for match in matches {
            let components = match.components(separatedBy: ";")
            switch components[2]{
            case "win":
                teams[components[0],default: TeamInfo()].wonGame()
                teams[components[1],default: TeamInfo()].lostGame()
            case "loss":
                teams[components[0],default: TeamInfo()].lostGame()
                teams[components[1],default: TeamInfo()].wonGame()
            case "draw":
                teams[components[0],default: TeamInfo()].drawnGame()
                teams[components[1],default: TeamInfo()].drawnGame()
            default:
                ()
            }
        }
        let sorted = teams.sorted{$0.1.totalPoints == $1.1.totalPoints ? $0.0 < $1.0 : $0.1.totalPoints > $1.1.totalPoints}
        return firstLine + "\n" + sorted.map {$0.0 + getEmpty(with: 31-$0.0.count) + "\($0.1)"}.joined(separator: "\n")
    }
    private func getEmpty(with size: Int) -> String{
        var res = ""
        for _ in 0..<size {res += " "}
        return res
    }
}