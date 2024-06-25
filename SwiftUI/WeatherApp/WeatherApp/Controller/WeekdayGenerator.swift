
import Foundation
func weekday(date: String) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    guard let updatedDate  = dateFormatter.date(from: date) else { return "---" }

    dateFormatter.dateFormat = "EEE"
    let weekday = dateFormatter.string(from: updatedDate).uppercased()

    return weekday
}

