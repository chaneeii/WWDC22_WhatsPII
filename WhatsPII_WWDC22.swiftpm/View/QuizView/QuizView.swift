import Foundation
import SwiftUI

struct QuizView: View {
    
    @ObservedObject var quizManagerVM: QuizManagerVM
    @State var answerSelection = QuizManagerVM().model.answerModel.contents
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.point_purple, .point_pink]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                
                if(quizManagerVM.model.quizCompleted){
                    
                    QuizCompletedView(quizManagerVM: quizManagerVM)
                    
                }else{
                    
                    VStack(alignment: .center , spacing: 20){
                        
                        Spacer(minLength: 0)
                        
                        // MARK: - Progress
                        HStack{
                            Text("\(quizManagerVM.model.currentQuestionIndex+1)")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top, 50)
                                .foregroundColor(.white)
                            
                            Text("/ \(quizManagerVM.maxIndex+1)")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top, 50)
                                .foregroundColor(.white)
                        }
                        
                        Spacer(minLength: 0)
                        
                        // MARK: - Quiz Content (Mail/Post)
                        VStack{
                            
                            if quizManagerVM.model.isAnswered {
                                
                                DescriptionCard(quizManagerVM: quizManagerVM)
                                
                            } else {

                                /* Quiz Type 1 : Mail */
                                if quizManagerVM.model.quizModel.category == "mail" {
                                    MailCard(selectedItems: $answerSelection, quizManagerVM: quizManagerVM)
                                /* Quiz Type 2 : Post */
                                }else {
                                    PostCard(selectedItems: $answerSelection, quizManagerVM: quizManagerVM)
                                }
                                
                            }
                        }.frame(width: geometry.size.width, height: geometry.size.height/1.4)
                        
                        Spacer(minLength: 0)
                        
                        // MARK: - Submit Btn
                        SubmitButton(isSubmitted: $quizManagerVM.model.isAnswered) {
                            
                            if quizManagerVM.model.isAnswered {
                                quizManagerVM.nextQuestion()
                            }else {
                                withAnimation{
                                    quizManagerVM.verifyingAnswer(selectedAnswer: AnswerModel(contents: answerSelection, file: quizManagerVM.model.answerModel.file, image: quizManagerVM.model.answerModel.image, isCorrect: false))
                                    
                                    answerSelection.removeAll()
                                }
                            }
                        }
                        Spacer(minLength: 40)
                        
                    }
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height,
                        alignment: .center
                    )
                    
                }
            }
            
        }
    }
    
}


struct SubmitButton: View {
    
    @Binding var isSubmitted: Bool
    var clicked: (() -> Void) 
    
    var body: some View {
        
        
        if isSubmitted {
            Button(action: clicked) {
                HStack {
                    Text("X")
                }
            }
            .padding()
            .font(.title2)
            .frame(width: 200)
            .background(.black.opacity(0.5))
            .clipShape(Capsule())
            .foregroundColor(.white)
            
        } else {
            
            Button(action: clicked) {
                HStack {
                    Text("Submit")
                }
                .padding()
                .font(.title2)
                .frame(width: 200)
                .background(.white)
                .clipShape(Capsule())
                .foregroundColor(.point_pink)
            }
            
        }
        
    }
}

