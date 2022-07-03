//  Created by Bahadir Etka Kilinc

struct ScaleGenerator {
    
    let sharps = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
    let flats = ["A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab"]
    
    let naturalKeys: Set = ["C", "a"]
    let flatKeys: Set = ["F", "Bb", "Eb", "Ab", "Db", "Gb", "d", "g", "c", "f", "bb", "eb"]
    
    var tonic: String
    var mode: String
    var pattern: String
    var name: String {return "\(tonic.capitalized) \(mode)"}
    
    init(tonic: String, scaleName: String, pattern: String = "mmmmmmmmmmmm") {
        self.tonic = tonic
        self.mode = scaleName
        self.pattern = pattern
    }
    
    
    func pitches() -> [String] {
        let intervals: [String: Int] = ["m": 1, "M": 2, "A": 3]
        let steps: [Int] = pattern.compactMap {intervals[String($0)]}
        var index = 0
        let isFlat = flatKeys.contains(tonic)
        if isFlat {
            index = flats.firstIndex(of: tonic.capitalized)!
        } else {
            index = sharps.firstIndex(of: tonic.capitalized)!
        }
        var indices: [Int] = [index]
        for i in (0..<steps.count-1) {
            indices.append((index + steps[i]) % 12)
            index += steps[i]
        }
        return isFlat ? indices.map {flats[$0]} : indices.map {sharps[$0]}
    }
}
