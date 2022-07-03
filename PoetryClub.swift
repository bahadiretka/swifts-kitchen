//  Created by Bahadir Etka Kilinc

import Foundation

func splitOnNewlines(_ poem: String) -> [String] {
    return poem.components(separatedBy: "\n")
}

func firstLetter(_ line: String) -> Character {
    return line.first ?? "_"
}

func capitalize(_ phrase: String) -> String {
    guard phrase.count > 0 else{ return "_" }
    return phrase.capitalized
}

func trimFromEnd(_ line: String) -> String {
    guard line.count > 0 else{ return "_" }
    return line.trimmingCharacters(in: .whitespacesAndNewlines)
}

func lastLetter(_ line: String) -> Character {
    return line.last ?? "_"
}

func backDoorPassword(_ phrase: String) -> String {
    return phrase.prefix(1).uppercased() + phrase.lowercased().dropFirst() + ", please"
}

func ithLetter(_ line: String, i: Int) -> Character {
    guard i >= 0 && i < line.count else {return " "}
    let index = line.index(line.startIndex, offsetBy: i)
    return line[index]
}

func secretRoomPassword(_ phrase: String) -> String {
    return phrase.uppercased() + "!"
}