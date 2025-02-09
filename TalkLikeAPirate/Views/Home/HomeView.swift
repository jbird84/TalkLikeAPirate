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
                    
                    NavigationLink(destination: BaseView(spinnerViewImageName: "pirateShip", spinnerViewText: "Translating to Pirate Speak...", characterName: CharacterName.pirate.rawValue, inputViewGenerateButtonColor: .piratePink)) {
                        IconButtonWithText(imageName: "whitePirate", textBelowImage: "Pirate", imageWidth: 160, imageHeight: 160)
                    }
                    .foregroundStyle(Color.white.opacity(0.3))
                    
                    NavigationLink(destination: BaseView(spinnerViewImageName: "greenLightSabre", spinnerViewText: "Translating to Yoda Speak...", characterName: CharacterName.yoda.rawValue, inputViewGenerateButtonColor: .yodaGreen)) {
                        IconButtonWithText(imageName: "whiteYoda", textBelowImage: "Yoda")
                    }
                    .foregroundStyle(Color.white.opacity(0.3))
                    
                    NavigationLink(destination: BaseView(spinnerViewImageName: "pigNose", spinnerViewText: "Translating to Pig Latin...", characterName: CharacterName.pig.rawValue, inputViewGenerateButtonColor: .pigPink)) {
                        IconButtonWithText(imageName: "whitePig", textBelowImage: "Pig Latin")
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
