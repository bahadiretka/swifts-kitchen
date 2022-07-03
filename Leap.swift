//  Created by Bahadir Etka Kilinc


struct Year{
    var year: Int
    var isLeapYear: Bool{
        get{
            return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
        }
    }
    init(calendarYear: Int){
        year = calendarYear
    }
}
