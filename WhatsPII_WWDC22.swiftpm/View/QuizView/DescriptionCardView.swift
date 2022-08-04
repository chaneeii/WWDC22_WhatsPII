import SwiftUI


struct DescriptionCard: View {
    
    var quizManagerVM: QuizManagerVM
    
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack {
                
                Spacer(minLength: (geometry.size.width > 768)
                       ? (geometry.size.width/5)
                       : (geometry.size.width/30) )
                
                VStack{
                    ZStack(alignment: .leading) {
                        
                        VStack(alignment: .leading){
                            
                            Spacer(minLength: 20)

                            ScrollView{
                                
                               /* CARD CONTENT */
                                VStack{
                                    checkAnswerText(quizManagerVM: quizManagerVM,
                                                    isTablet: geometry.size.width > 768 ? true : false)
                                    
                                    Spacer(minLength: geometry.size.width > 768 ? 100 : 50)
                                    
                                    Text(quizManagerVM.model.quizModel.solution)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                        
                                    Spacer(minLength: 0)
                                }
                            }
                            .foregroundColor(.white)
                            .padding()

                            Spacer(minLength: 20)
                            
                        }
                        .background(quizManagerVM.model.isCorrected ? .green : .red)
                        .cornerRadius(24)
                        .padding()
                        .foregroundColor(.white)
                        
                    }
                    .frame(height: geometry.size.height)
                    
                }
                Spacer(minLength: (geometry.size.width > 768)
                       ? (geometry.size.width/5)
                       : (geometry.size.width/30) )
            }
        }
    }
}



struct checkAnswerText: View {
    
    var quizManagerVM: QuizManagerVM
    var isTablet: Bool
    
    var body: some View {
        
        GeometryReader { geometry in
                
            HStack{
                Text(quizManagerVM.model.isCorrected ? "CORRECT": "INCORRECT")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            .frame(width: isTablet ? geometry.size.width: 280, height: 80, alignment: .center)

        }
    }
}
