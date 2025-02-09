//
//  IconButtonWithText.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/8/25.
//

import SwiftUI

struct IconButtonWithText: View {
    var imageName: String
    var textBelowImage: String
    
    var body: some View {
        VStack {
            
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 140)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 130, height: 130)
                )
                .frame(width: 150, height: 150)
                .background(
                    Circle()
                        .fill(Color.white.opacity(0.3))
                )
            
            Text(textBelowImage)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    IconButtonWithText(imageName: "whitePirate", textBelowImage: "Pirate")
}
