import SwiftUI

struct PostCard: View {
    
    @Binding var selectedItems: [String]
    var quizManagerVM: QuizManagerVM
    
    var body: some View {
        
        GeometryReader { geometry in
            HStack{
                
                Spacer(minLength: (geometry.size.width > 768) ? (geometry.size.width/5) : (geometry.size.width/30) )
                
                VStack{
                    ZStack(alignment: .leading) {
                        VStack(alignment: .leading){
                            ScrollView{
                                // Main Contents
                                    
                                    VStack(alignment: .leading){
                                        Spacer(minLength: geometry.size.width > 768 ? 20 : 10)
                                        // MARK: - Title
                                        Text("🐥 Amy's Blog")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .padding()

                                        
                                        Spacer(minLength: 15)
                                        
                                        // MARK: - Content
                                        ForEach(quizManagerVM.model.quizModel.contents, id: \.self){ content in
                                            if content == "\n" || content == "" {
                                                Text("").padding(3)
                                            }
                                            else{
                                                Button(action: {
                                                    withAnimation {
                                                        if self.selectedItems.contains(content) {
                                                            self.selectedItems.removeAll(where: { $0 == content })
                                                        } else {
                                                            self.selectedItems.append(content)
                                                        }
                                                    }
                                                    
                                                })
                                                {
                                                    HStack{
                                                        Text(content)
                                                            .fontWeight(.regular)
                                                            .kerning(1.3)
                                                            .multilineTextAlignment(.leading)
                                                            .padding(.horizontal)
                                                            .background(self.selectedItems.contains(content) ? Color.black :  Color.white)
                                                            .foregroundColor(Color.black)
                                                            .padding(2)
                                                    }
                                                }
                                                
                                            }
                                        }
                                        Spacer(minLength: 0)
                                        VStack{
                                            // Attached File List
                                            if(quizManagerVM.model.quizModel.attachedImage.0 == ""){
                                                // No Attached
                                            }else{
                                            VStack(alignment: .leading){
                                                
                                                ImageBox(quizManagerVM: quizManagerVM, text: quizManagerVM.model.quizModel.attachedImage.0, isTablet: geometry.size.width > 768 ? true : false)
                                                
                                                Spacer(minLength: 300)
                                                
                                            }
                                            .padding(geometry.size.width > 768 ? 30 : 5)
                                            }

                                        }
                                    }
                                    .padding()
                            }
                            Spacer(minLength: 20)
                        }
                        .background(.white)
                        .cornerRadius(24)
                        .padding()
                    }
                    .frame(height: geometry.size.height)
                }
                Spacer(minLength: (geometry.size.width > 768) ? (geometry.size.width/5) : (geometry.size.width/30) )
            }
        }
    }
}


struct ImageBox: View {
    
    var quizManagerVM: QuizManagerVM
    var text: String
    @State var locked: Bool = false
    @State var isTablet: Bool
    
    var body: some View {
        
        GeometryReader { geometry in
            Button(action: {
                locked.toggle()
                quizManagerVM.model.answerModel.image.toggle()
                print("\(quizManagerVM.model.answerModel.image)")
                
            }) {
                
                HStack(alignment: .center){
                    Image(locked ? "lockedImage" : "\(quizManagerVM.model.quizModel.attachedImage.0)" )
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: isTablet ? geometry.size.width : 280, height: 280, alignment: .leading)
                .background(Color.light_gray)
                .cornerRadius(30)

            }
            
        }
        
    }
}






