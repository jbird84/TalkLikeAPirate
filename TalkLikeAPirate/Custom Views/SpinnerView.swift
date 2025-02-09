//
// SpinnerView.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//

import SwiftUI

struct SpinnerView: View {
    
    @State private var rotationAngle: Double = 0
    var spinningImageName: String
    var translatingText: String
    
    var body: some View {
        VStack(alignment: .center) {
                ZStack {
                    Image(spinningImageName)
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                    .rotationEffect(.degrees(rotationAngle))
                    .onAppear {
                        withAnimation(
                            Animation.linear(duration: 2)
                                .repeatForever(autoreverses: true)
                        ) {
                            rotationAngle = 360
                        }
                    }
                
                Text(translatingText)
                .font(.system(size: 20, weight: .heavy, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 50)
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.gradient)
    }
}

#Preview {
    SpinnerView(spinningImageName: "pigNose", translatingText: "Translating to Yoda Speak...")
}
