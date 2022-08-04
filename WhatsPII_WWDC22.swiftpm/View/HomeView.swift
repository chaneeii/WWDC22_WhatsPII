import SwiftUI

// Home Page
struct HomeView: View {
    
    @State var isStarted = false
    @State var isUserGuide = false
    
    var body: some View {
        
        if isStarted == true {
            QuizView(quizManagerVM: QuizManagerVM())
        }
        else{
            
            if isUserGuide == true {

                AboutView()
                
            }else{
                
                
                ZStack{

                    LinearGradient(gradient: Gradient(colors: [.point_purple, .point_pink]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    
                    /* Home Content */
                    VStack{
                        
                        Spacer(minLength: 0)
                        
                        Text("WHAT's PII")
                            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                        Spacer(minLength: 0)
                        
                        
                        /* Start Quiz */
                        Button(action: {
                            withAnimation{
                                isStarted.toggle()
                            }
                        }) {
                            ZStack{
                                Circle()
                                    .fill(.white)
                                    .frame(width: 230, height: 230)
                                    .shadow(color: .white, radius: 1, x: 2, y: 2)
                                
                                Text("START\nQUIZ")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.point_purple)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        
                        
                        
                        
                        Spacer(minLength: 0)
                        
                        
                        /* About PII - Description */
                        Button(action: {
                            withAnimation{
                                isUserGuide.toggle()
                            }
                        }) {
                            Text("About PII")
                                .fontWeight(.semibold)
                                .kerning(1.2)
                        }
                        .padding(.bottom, 20)
                        .foregroundColor(.white)
                        
                        
                        Spacer(minLength: 0)
                        
                    }
                }
                
                
            }  
            
            
        }
        
    }
    
    
}
