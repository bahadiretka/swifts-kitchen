//  Created by Bahadir Etka Kilinc
import Foundation
extension Array where Element == String{
    func indexOf(element: String) -> Int?{
        for (index,str) in self.enumerated(){
            if element == str{ return index }
        }
        return nil
    }
}
struct Poker{
    static func bestHand(_ hands: [String]) -> String?{
        return hands.compactMap{PokerHand($0)}.sorted(by: {$0.score < $1.score}).last!.description
    }
}
struct PokerHand: CustomStringConvertible{
    var cards = [Card]()
    init?(_ hand: String){
        let cards = hand.components(separatedBy: " ")
        for card in cards{
            if let card = Card(card){ self.cards.append(card)}
            else{ return nil }
        }
        if cards.count != 5 {return nil}
    }
    var score: Int{
        let ranks = cards.compactMap{Int(Card.ranks.indexOf(element: $0.rank)!+2)}
        let suits = cards.map{Int(pow(2,Double(Card.suits.indexOf(element: $0.suit)!)))}
        let type = evaluate(ranks, suits)
        let paired = Dictionary(grouping: ranks, by: {$0}).filter { $1.count > 1 }.keys.first
        let sum = Set(ranks).reduce(0){$0 + $1}
        switch type{
        case "High Card": return 100 + sum
        case "1 Pair": return 200 + paired!
        case "2 Pair": return 300 + paired!
        case "3 of a Kind": return 400 + paired!
        case "Straight": return 500
        case "Flush": return 600
        case "Full House": return 700 - sum
        case "4 of a Kind": return 800
        case "Straight Flush": return 900
        case "Royal Flush": return 1000
        default: return 0
        }
    }
    private func evaluate(_ ranks: [Int], _ suits: [Int]) -> String{
        let hands=["4 of a Kind", "Straight Flush", "Straight", "Flush", "High Card","1 Pair", "2 Pair", "Royal Flush", "3 of a Kind", "Full House" ];
        let s = 1 << ranks[0] | 1 << ranks[1] | 1 << ranks[2] | 1 << ranks[3] | 1 << ranks[4];
        var i = -1, v = 0, o = 0
        repeat{
            i += 1
            o = Int(pow(2, Double(ranks[i] * 4)))
            v += o*((v/o&15)+1)
        }while i < 4
        v = v % 15 - ((s / (s & -s) == 31) || (s == 0x403c) ? 3 : 1);
        v -= (suits[0] == (suits[1] | suits[2] | suits[3] | suits[4]) ? 1 : 0) * ((s == 0x7c00) ? -5 : 1);
        return hands[v]
    }
    var description: String{
        return cards.map{String($0.description)}.joined(separator: " ")
    }
}
struct Card: CustomStringConvertible{
    static let suits = ["♤","♧","♡","♢"]
    static let ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    var rank: String
    var suit: String
    init?(_ card: String){
        self.suit = String(card.last!)
        self.rank = String(card.dropLast())
        guard Card.suits.contains(suit) && Card.ranks.contains(rank) else{return nil}
    }
    var description: String{
        return "\(rank)\(suit)"
    }
}