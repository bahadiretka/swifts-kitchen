//  Created by Bahadir Etka Kilinc

struct House {
    static let sentences:[(start :String, end :String)] = [
        ("lay in", "house that Jack built."),
        ("ate", "malt"),
        ("killed", "rat"),
        ("worried", "cat"),
        ("tossed", "dog"),
        ("milked", "cow with the crumpled horn"),
        ("kissed", "maiden all forlorn"),
        ("married", "man all tattered and torn"),
        ("woke", "priest all shaven and shorn"),
        ("kept", "rooster that crowed in the morn"),
        ("belonged to", "farmer sowing his corn"),
        ("", "horse and the hound and the horn")
    ]
    
    

    static func recite() -> String {
        return createJack(sentences).joined(separator: "\n\n")
    }
    static func createJack(_ sequence: [(start: String, end: String)]) -> [String]{
        if sequence.count == 0{
            return []
        }
        var verse = [String]()
        for i in 0..<sequence.count{
            if i == sequence.count - 1{
                verse.append("This is the \(sequence[i].end)")
            }else{
                verse.append("that \(sequence[i].start) the \(sequence[i].end)")
            }
        }
        return createJack(sequence.dropLast()) + [verse.reversed().joined(separator: "\n")]
    }
}



// alternative
//struct House {
//    static let sentences:[(start :String, end :String)] = [
//        ("lay in", "house that Jack built."),
//        ("ate", "malt"),
//        ("killed", "rat"),
//        ("worried", "cat"),
//        ("tossed", "dog"),
//        ("milked", "cow with the crumpled horn"),
//        ("kissed", "maiden all forlorn"),
//        ("married", "man all tattered and torn"),
//        ("woke", "priest all shaven and shorn"),
//        ("kept", "rooster that crowed in the morn"),
//        ("belonged to", "farmer sowing his corn"),
//        ("", "horse and the hound and the horn")
//    ]
//
//    static func recite() -> String {
//        return (0..<sentences.count).map{
//            sentences[...$0]
//                .reversed()
//                .enumerated()
//                .map({ (str)->String in
//                    if str.offset == 0 {
//                        return "This is the \(str.element.end)"
//                    } else {
//                        return "that \(str.element.start) the \(str.element.end)"
//                    }
//                })
//                .joined(separator: "\n")
//        }.joined(separator: "\n\n")
//    }
//}