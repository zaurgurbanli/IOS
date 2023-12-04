
import Foundation

struct Question {
    var question: String
    var answers: [String]
    var correctAnswer: String
    
    init(q: String,a:[String],c:String) {
        self.question = q
        self.answers = a
        self.correctAnswer = c
    }
}
