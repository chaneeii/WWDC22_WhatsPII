import Foundation
import SwiftUI

struct OnBoardingView: View {
    
    @AppStorage("currentPageOfOnBoarding") var currentPageOfOnBoarding = 1
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack{
                switch currentPageOfOnBoarding {
                case 1:
                    ScreenView(title: "Welcome", content: "FIND *PII DATA AND HIDE IT", step: 1 )
                case 2:
                    ScreenView(title: "What's PII?", content: "Personally Identifiable Information (PII) is a legal term pertaining to information security environments.\n\nAccording to the NIST PII Guide and DHS, Personally Identifiable Information (PII) can unequivocally identify a human being.\n\nAnd Sensitive PII (SPII) is Personally Identifiable Information,which if lost, compromised, or disclosed without authorization, could result in substantial harm,embarrassment, inconvenience, or unfairness to an individual.\n\n **PII can become more sensitive when combined with other information.**", step: 2 )
                case 3:
                    ScreenView(title: "Example of PII", content: "- Name, Adresss, Phone numbers etc.\n\n - Personal characteristics, including photographic image, x-rays, fingerprints, or other biometric image or template data \n\n- Asset information, such as Internet Protocol (IP) or Media Access Control (MAC) address or other host-specific persistent static identifier that consistently links to a particular person or small, welldefined group of people\n\n- Personal identification number, such as social security number (SSN), passport number, driver‘s license number, financial account or credit card number. \n\n- Information identifying personally owned property\n\n- Information about an individual that is linked or linkable to one of the above", step: 3 )
                case 4:
                    ScreenView(title: "How To Play", content: "In a given situation, protect your valuable personal information by masking sentences that contain PII, and locking photos and files!", step: 4 )
                default:
                    EmptyView()
                }
            }// zstack
            .overlay(
                
                /* BUTTON */
                Button(currentPageOfOnBoarding==4 ? "Start What's PII" : "Next") {
                    withAnimation(.easeInOut){
                        if currentPageOfOnBoarding <= totalPagesOfOnBoarding {
                            currentPageOfOnBoarding += 1
                        }
                        else {
                            currentPageOfOnBoarding = 1
                        }
                    }
                }
                    .padding()
                    .frame(width: 200.0)
                    .background(.white)
                    .clipShape(Capsule())
                    .foregroundColor(.point_pink)
                    .padding(.bottom, geometry.size.width > 768 ? 100 : 20)
                ,alignment: .bottom
                
                
            )
        }
    }
}


struct ScreenView: View {
    
    var title: String
    var content: String
    var step: Int
    
    @AppStorage("currentPageOfOnBoarding") var currentPageOfOnBoarding = 1
    
    var body: some View {
        
        GeometryReader { geometry in
            HStack{
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [.point_purple, .point_pink]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    
                    // MARK: - Card Contents
                    VStack(spacing: 20){
                        HStack{
                            if currentPageOfOnBoarding > 1 {
                                Button(action: {
                                    withAnimation(.easeInOut){
                                        currentPageOfOnBoarding -= 1
                                    }
                                },label:{
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.point_purple)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal)
                                        .background(Color.white.opacity(0.4))
                                        .cornerRadius(10)
                                })
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                withAnimation(.easeInOut){
                                    currentPageOfOnBoarding = 5
                                }
                            },label:{
                                Text("Skip")
                                    .fontWeight(.semibold)
                                    .kerning(1.2)
                                    .foregroundColor(.white)
                            })
                        }
                        .frame(height: 45)
                        .foregroundColor(.black)
                        .padding()
                        
                        if currentPageOfOnBoarding == 1 {
                            
                            VStack{
                                Spacer()
                                Text(content)
                                    .foregroundColor(.white)
                                    .font(geometry.size.width>768 ? .largeTitle :.title2)
                                    .fontWeight(.black)
                                Image("guide1")
                                    .resizable()
                                    .frame(width: geometry.size.width>768 ? 300 : 200, height: geometry.size.width>768 ? 300 : 200, alignment: .center)
                                Text("*Personally Identifiable Information (PII)")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            
                        }
                        else if currentPageOfOnBoarding == 4 {
                            VStack(alignment: .center){
                                Spacer()
                                Text(title)
                                    .foregroundColor(.white)
                                    .font(geometry.size.width>768 ? .largeTitle :.title2)
                                    .fontWeight(.black)
                                Text(content)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                    .padding(10)
//                                    .frame(height: .infinity, alignment: .center)
                                
                                Image("guide4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width>768 ? 500 : 350, height:geometry.size.width>768 ? 520 : 300, alignment: .center)
                                Spacer()
                            }
                        }
                        else {
                            Spacer(minLength: 0)
                            VStack(alignment: .center){
                                Text(title)
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                            }.padding(.bottom, geometry.size.width>768 ? 50 : 5)
                            VStack(alignment: .leading){
                                ScrollView{
                                    VStack(alignment: .leading){
                                        Text(content)
                                            .fontWeight(.regular)
                                            .kerning(1.3)
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                    }
                                    .frame(alignment: .center)
                                    .padding()
                                }
                            }
                            .frame(width: geometry.size.width>768 ? 500 : 350, height:geometry.size.width>768 ? 520 : 450)
                            .foregroundColor(.black.opacity(0.8))
                            .background(.white.opacity(0.5))
                            .cornerRadius(24)
                            .padding()
                            .padding(.bottom, 50)
                        }
                        Spacer(minLength: 100)
                    }
                }
            }
        }
    }
}


struct OnBoardingButton: View {
    
    @State var currentPageOfOnBoarding: Int
    
    var body: some View {
        Button(currentPageOfOnBoarding==4 ? "Start What's PII" : "Next") {
            withAnimation(.easeInOut){
                if currentPageOfOnBoarding <= totalPagesOfOnBoarding {
                    currentPageOfOnBoarding += 1
                }
                else {
                    currentPageOfOnBoarding = 1
                }
            }
        }
        .padding()
        .frame(width: 200.0)
        .background(.white)
        .clipShape(Capsule())
        .foregroundColor(.point_pink)
    }
}
