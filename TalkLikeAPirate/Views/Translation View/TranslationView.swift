//
//  TranslationView.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//

import SwiftUI

struct TranslationView: View {
    var characterName: String
    var translatedText: String
    var onDisappear: () -> Void
    
    private let translationTitles: [String: String] = [
           "pirate": "🏴‍☠️ Pirate Translation 🏴‍☠️",
           "yoda": "🛰️ Yoda Translation 🛰️"
       ]
    
    private let translationBackgroundColors: [String: Color] = [
        "pirate": .piratePink,
        "yoda": .yodaGreen
       ]
    
    private var translationTitle: String {
        translationTitles[characterName.lowercased()] ?? "☹️ No character name found ☹️"
    }
    
    private var translationBackgroundColor: Color {
        translationBackgroundColors[characterName.lowercased()] ?? .blue
    }
    
    var body: some View {
        VStack {
            Text(translationTitle)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
            VStack {
                Text(translatedText)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(15)
            }
            .padding(.horizontal, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(translationBackgroundColor.gradient)
        .onDisappear {
            onDisappear()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    onDisappear()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundStyle(Color.black.opacity(0.8))
                }
            }
        }
    }
    
    enum TransistionTitle: String {
        case pirate = "🏴‍☠️ Pirate Translation 🏴‍☠️"
        case yoda = "🛰️ Yoda Translation 🛰️"
    }
}



#Preview {
    TranslationView(characterName: "pirate", translatedText: "Wow, this turned out great!", onDisappear: {})
}
