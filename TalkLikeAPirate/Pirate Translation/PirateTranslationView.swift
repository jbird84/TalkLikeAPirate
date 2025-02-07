//
//  PirateTranslationView.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//

import SwiftUI

struct PirateTranslationView: View {
    var translatedText: String
    var onDisappear: () -> Void
    
    var body: some View {
        
        VStack {
            Text("🏴‍☠️ Pirate Translation 🏴‍☠️")
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
        .background(Color.blue.gradient)
        .onDisappear {
            onDisappear() // Reset viewModel when user goes back
        }
    }
}

#Preview {
    PirateTranslationView(translatedText: "Wow, this turned out great!", onDisappear: {})
}
