import SwiftUI

struct MailCard: View {
    
    @Binding var selectedItems: [String]
    var quizManagerVM: QuizManagerVM
    
    
    var body: some View {
//        print(selectedItems)
        return GeometryReader { geometry in
            HStack {
                
                Spacer(minLength: (geometry.size.width > 768) ? (geometry.size.width/5) : (geometry.size.width/30) )
                
                VStack{
                    ZStack(alignment: .leading) {
                        
                        VStack(alignment: .leading){
                            
                            Spacer(minLength: 20)

                            ScrollView{
                                
                                VStack(alignment: .leading){
                                    Spacer(minLength: 20)
                                    
                                    /* Content */
                                    VStack(alignment: .leading){
                                        ForEach(quizManagerVM.model.quizModel.contents, id: \.self){ content in
                                            Button(action: {
                                                withAnimation {
                                                    if self.selectedItems.contains(content) {
                                                        self.selectedItems.removeAll(where: { $0 == content })
                                                    } else {
                                                        self.selectedItems.append(content)
                                                    }
                                                }

                                            }) {
                                                    Text(content)
                                                        .fontWeight(.regular)
                                                        .kerning(1.3)
                                                        .multilineTextAlignment(.leading)
                                                        .padding(.horizontal)
                                                        .background(self.selectedItems.contains(content) ?
                                                                    Color.black : Color.white)
                                                        .foregroundColor(Color.black)
                                                        .padding(2)
                                            }
                                        }
                                    }
                                    .padding()
                                    
                                    Spacer(minLength: 0)
                                    
                                    /* Attach */
                                    if quizManagerVM.model.quizModel.attachedFile.0 != "" {
                                        
                                        VStack(alignment: .leading){
                                            HStack{
                                                Image(systemName: "paperclip")
                                                    .font(.system(.body))
                                                Text("Attachment")
                                            }
                                            .foregroundColor(.dark_gray)
                                            
                                            AttachBox(isTablet: geometry.size.width > 768 ? true : false,
                                                      quizManagerVM: quizManagerVM,
                                                      text: quizManagerVM.model.quizModel.attachedFile.0)
                                            
                                            
                                            Spacer(minLength: 80)
                                        }
                                        .padding(15)
                                        
                                    }
                                    
                                }
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


struct AttachBox: View {
    
    @State var locked: Bool = false
    @State var isTablet: Bool
    var quizManagerVM: QuizManagerVM
    var text: String
    
    var body: some View {
        
        GeometryReader { geometry in
            
            Button(action: {
                locked.toggle()
                quizManagerVM.model.answerModel.file.toggle()
            }) {
                
                HStack(alignment: .center){
                    Text(locked ? "🔐" : "🔓" ).padding(.leading, 20)
                    Text(text)
                    Spacer()
                }
                .frame(width: isTablet ? geometry.size.width : 280, height: 80, alignment: .leading)
                .foregroundColor(Color.dark_gray)
                .background(Color.light_gray)
                .cornerRadius(30)

            }
        }

    }
}
