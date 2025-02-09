//
//  HomeView.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/8/25.
//


import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    NavigationLink(destination: BaseView(inputViewTopImageName: "pirate", inputViewGenerateButtonColor: .piratePink)) {
                        IconButtonWithText(imageName: "whitePirate", textBelowImage: "Pirate")
                    }
                    .foregroundStyle(Color.white.opacity(0.3))
                    
                    NavigationLink(destination: BaseView(inputViewTopImageName: "yoda", inputViewGenerateButtonColor: .yodaGreen)) {
                        IconButtonWithText(imageName: "whitePirate", textBelowImage: "Yoda")
                    }
                    .foregroundStyle(Color.white.opacity(0.3))
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
