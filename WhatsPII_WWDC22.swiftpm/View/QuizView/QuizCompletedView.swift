import SwiftUI

struct QuizCompletedView: View {
    
    @State var isHomeSelected: Bool = false
    var quizManagerVM: QuizManagerVM
    
    var body: some View {
        
        if isHomeSelected == true {
            
            HomeView()
            
        }else{
            GeometryReader { geometry in
                VStack{
                    Spacer()
                    Text("COMEPLETE")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                    ZStack{
                        Circle()
                            .strokeBorder(Color.white,lineWidth: 4)
                            .background(Circle().foregroundColor(Color.white))
                            .frame(width: 230, height: 230)
                            .blur(radius: 5)
                        VStack{
                            Text("SCORE")
                                .font(.title2)
                                .foregroundColor(Color.point_purple)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            Text("\(quizManagerVM.numOfCorrected) / \(quizManagerVM.maxIndex + 1)")
                                .foregroundColor(Color.point_purple)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding()
                    Spacer()
                    Button("Go To Home") {
                        quizManagerVM.reset()
                        withAnimation{
                            isHomeSelected.toggle()
                        }
                    }.foregroundColor(.white)
                    Spacer()
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
