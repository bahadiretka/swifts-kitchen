//  Created by Bahadir Etka Kilinc


struct GradeSchool {
    
    var roster = [Int : [String]]()
    
    lazy var sortedRoster = {
        return roster.mapValues { $0.sorted(by: <) }
    }()
    mutating func addStudent(_ name: String, grade: Int) {
        roster[grade, default: [String]()].append(name)
    }
    func studentsInGrade(_ grade: Int) -> [String]{
        return roster[grade] ?? []
    }
}