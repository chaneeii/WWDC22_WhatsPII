//
//  File.swift
//  What's PII
//
//  Created by Chanhee Jeong
//

import Foundation
import SwiftUI


class QuizManagerVM: ObservableObject {
    
    static var currentIndex = 0
    let maxIndex = 9
    var numOfCorrected = 0
    
    static func createQuizModel(i:Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model = QuizManagerVM.createQuizModel(i: QuizManagerVM.currentIndex)
    
    func verifyingAnswer(selectedAnswer: AnswerModel){
        if selectedAnswer.contents == model.quizModel.answers &&
            selectedAnswer.image == model.quizModel.attachedImage.1
            && selectedAnswer.file == model.quizModel.attachedFile.1{
            self.model.isCorrected = true
            self.model.isAnswered = true
            self.numOfCorrected += 1
        }else{
            self.model.isCorrected = false
            self.model.isAnswered = true
        }
    }
    
    func nextQuestion() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if (QuizManagerVM.currentIndex < self.maxIndex) {
                QuizManagerVM.currentIndex = QuizManagerVM.currentIndex + 1
                self.model = QuizManagerVM.createQuizModel(i: QuizManagerVM.currentIndex)
                
            } else {
                self.model.quizCompleted = true
                
            }
        }
    }
    
    func reset() {
        self.numOfCorrected = 0
        QuizManagerVM.currentIndex = 0
    }
    
}



// Quiz Mock Data
extension QuizManagerVM
{
    static let quizData: [QuizModel] =
    
    [
        
        QuizModel(category: "mail",
                  contents: ["Dear Elisa,\n","Thank you for the offer.","Please find attached.\n","Best,\nAsher"],
                  answers: [],
                  attachedFile: ("Copy of Asher’s ID Card",true),
                  attachedImage: ("",false),
                  solution: "ID cards contain very sensitive PII data."),
        
        QuizModel(category: "mail",
                  contents: ["FYI )\n","ID: avery@icloud.com\nPW: 029384\n","Best,\nAvery"],
                  answers: ["ID: avery@icloud.com\nPW: 029384\n"],
                  attachedFile: ("Avery's Account Password",true),
                  attachedImage: ("",false),
                  solution: "ID cards contain very sensitive PII data."),
        
        QuizModel(category: "post",
                  contents: ["Today, I'd like to share some tips for having the most perfect home party.\n", "First, look at those pretty decorations when I have a party in my place!","(9991 Longbottom Rd Traphill, North Carolina (NC), 28685.)"],
                  answers: ["(9991 Longbottom Rd Traphill, North Carolina (NC), 28685.)"],
                  attachedFile: ("",false),
                  attachedImage: ("post1",false),
                  solution: "The home address is an important PII data."),
        QuizModel(category: "mail",
                  contents: ["Hi Dr.Kim,\n","Please find your new client’s information.\n","Name: John Doe\nSocial Security Number :234-124-3342\n","Cheers,\nJay"],
                  answers: ["Name: John Doe\nSocial Security Number :234-124-3342\n"],
                  attachedFile: ("MedicalRecord-JohnDoe",true),
                  attachedImage: ("",false),
                  solution: "The social security number contains very sensitive PII data. Also the attached medical record acts as very important information, especially when combined with other PII data like Social Security Number"),
        QuizModel(category: "mail",
                  contents: ["To whom may it concern,\n","My bank account is currently not blocked.","Could you please check what happened?\n","Credit Card Number : 0293-1924-3423-3134","PIN : 2123\n","Cheers,\nTerry"],
                  answers: ["Credit Card Number : 0293-1924-3423-3134","PIN : 2123\n"],
                  attachedFile: ("Copy of Credit-Card",true),
                  attachedImage: ("",false),
                  solution: "Credit Card Numbers and PIN are very important PII data related to credit transactions. Therefore, particular attention should be paid to handling the relevant information."),
        QuizModel(category: "mail",
                  contents: ["Dear Sally,\n","Please find additional information needed for my immigration.\n","- SSN : 0293-924-3423","- Financial Account Numbers: 29383372019","- Address in US : 620 Curson Ave, Los Angeles, CA 90036\n","Regards,\nLucy"],
                  answers: ["- SSN : 0293-924-3423","- Financial Account Numbers: 29383372019","- Address in US : 620 Curson Ave, Los Angeles, CA 90036\n"],
                  attachedFile: ("Tips for immigration.pdf",false),
                  attachedImage: ("",false),
                  solution: "Social security numbers, financial account numbers and your address are very important information. Always pay attention to exposure."),
        QuizModel(category: "mail",
                  contents: ["TO : BMM Driving Center\n","Here’s that information you asked for my reservation this sunday.\n","- Driving Licencse Number: MORGA7643273MD8J","- National Insurance Number: MQE272346C\n","Best,\nHans Zimmer"],
                  answers: ["- Driving Licencse Number: MORGA7643273MD8J","- National Insurance Number: MQE272346C\n"], attachedFile: ("Copy of Driving License",true),
                  attachedImage: ("",false),
                  solution: "Driving license includes PII data."),
        QuizModel(category: "post",
                  contents: ["One of the most-asked questions about credit cards is how does it affect your credit score?\n", "I've had several credit cards issued over the years, and I still have a good score."],
                  answers: [],
                  attachedFile: ("",false),
                  attachedImage: ("post2",true),
                  solution: "Credit card information is very sensitive PII data.\nExposing credit card information online is dangerous."),
        
        QuizModel(category: "post",
                  contents: ["I recently visited Paris after a long time.\n", "In this post, I would like to share my travel tips."],
                  answers: [],
                  attachedFile: ("",false),
                  attachedImage: ("post3", true),
                  solution: "Passports and tickets contain multiple PII data."),
        
        QuizModel(category: "mail",
                  contents: ["Hi Chris!\n","How are you?", "We haven’t seen you in ages!\n","I’m having a birthday party next Friday at my house.\n","Would you like to come?\n","Hope you can come and see you soon,\nLisa"],
                  answers: [],
                  attachedFile: ("My Home Address.txt",true),
                  attachedImage: ("",false),
                  solution: "Lisa's home address is PII data.")
        
    ]
}



