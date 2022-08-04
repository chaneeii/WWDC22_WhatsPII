import Foundation

struct Quiz {
    var currentQuestionIndex: Int
    var quizModel: QuizModel
    var quizCompleted: Bool = false
    var isCorrected: Bool = false
    var isAnswered: Bool = false
    var answerModel: AnswerModel = AnswerModel(contents: [], file: false, image: false, isCorrect: false)
}
