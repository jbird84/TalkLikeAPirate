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
    var imageWidth: Double = 117
    var imageHeight: Double = 120
    
    var body: some View {
        VStack {
            
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: imageWidth, height: imageHeight)
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
    IconButtonWithText(imageName: "whitePig", textBelowImage: "Pirate")
}
