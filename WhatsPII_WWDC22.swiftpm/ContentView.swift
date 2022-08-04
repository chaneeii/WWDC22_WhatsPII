import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPageOfOnBoarding") var currentPageOfOnBoarding = 1
    
    var body: some View {
        
        if currentPageOfOnBoarding > totalPagesOfOnBoarding {
            HomeView()
        } else {
            OnBoardingView()
        }
    }
}

// OnBoarding - Total Pages
var totalPagesOfOnBoarding = 4
