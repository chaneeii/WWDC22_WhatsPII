import SwiftUI


struct AboutView: View {
    
    @State var isHome : Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            if isHome == true {
                
                HomeView()
                
            } else {
                VStack{
                    
                    ZStack{
                        
                        LinearGradient(gradient: Gradient(colors: [.point_purple, .point_pink]),
                                       startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                        
                        /* Card Content */
                        VStack(spacing: 20){
                            
                            Spacer(minLength: 0)
                            
                            VStack(alignment: .center){
                                Text("About PII")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                            }.padding(.bottom, geometry.size.width>768 ? 50 : 5)
                            
                            VStack(alignment: .leading){
                                ScrollView{
                                    VStack(alignment: .leading){
                                        
                                        Text("What is PII?")
                                            .fontWeight(.heavy)
                                            .kerning(1.3)
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                            .padding(.top, 30)
                                        
                                        Text("Personally Identifiable Information (PII) is a legal term pertaining to information security environments.\n\nAccording to the NIST PII Guide and DHS, Personally Identifiable Information (PII) can unequivocally identify a human being.\n\nAnd Sensitive PII (SPII) is Personally Identifiable Information,which if lost, compromised, or disclosed without authorization, could result in substantial harm,embarrassment, inconvenience, or unfairness to an individual.\n\n**PII can become more sensitive when combined with other information.**")
                                            .fontWeight(.regular)
                                            .kerning(1.3)
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                        
                                        Text("Example of PII Data")
                                            .fontWeight(.heavy)
                                            .kerning(1.3)
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                            .padding(.top, 30)
                                        
                                        Text("- Name, Adresss, Phone numbers etc.\n\n - Personal characteristics, including photographic image, x-rays, fingerprints, or other biometric image or template data \n\n- Asset information, such as Internet Protocol (IP) or Media Access Control (MAC) address or other host-specific persistent static identifier that consistently links to a particular person or small, welldefined group of people\n\n- Personal identification number, such as social security number (SSN), passport number, driver‘s license number, financial account or credit card number. \n\n- Information identifying personally owned property\n\n- Information about an individual that is linked or linkable to one of the above")
                                            .fontWeight(.regular)
                                            .kerning(1.3)
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                        
                                    }
                                    .frame(alignment: .center)
                                    .padding()
                                }
                                
                            }
                            .frame(width: geometry.size.width>768 ? 500 : 350, height: geometry.size.width>768 ? 520 : 450)
                            .foregroundColor(.black.opacity(0.8))
                            .background(.white.opacity(0.5))
                            .cornerRadius(24)
                            .padding()
                            .padding(.bottom, 50)
                            
                            Button(action: {
                                
                                withAnimation{
                                    isHome.toggle()
                                }
                                
                            }) {
                                Text("GO TO HOME")
                                    .fontWeight(.semibold)
                                    .kerning(1.2)
                            }
                            .padding(.bottom, 20)
                            .foregroundColor(.white)

                            Spacer()
                            
                        }
                        
                    }
                }
            }
        }
    }
}


