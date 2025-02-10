//
//  HomeView.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/8/25.
//


import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack {
                                // Custom trapezoidal background
                                Trapezoid()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.pink.opacity(0.1)]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                    .frame(width: 460, height: 210)
                                    .shadow(radius: 10)
                                
                                // Text
                                Text("Select A Translation Type")
                            .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.top, 40)
                            }
                    .ignoresSafeArea()
                    
                    Spacer()
                    
                    ForEach(viewModel.characterOptions.indices, id: \.self) { index in
                        let option = viewModel.characterOptions[index]
                        NavigationLink(destination: option.destination) {
                            IconButtonWithText(imageName: option.imageName, textBelowImage: option.textBelowImage)
                        }
                        .foregroundStyle(Color.white.opacity(0.3))
                    }
                }
                .padding(.bottom,20)
            }
        }
    }
}

struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let topWidth = rect.width
        let bottomWidth = rect.width * 0.8 // Adjust bottom width for slant effect
        let height = rect.height
        
        path.move(to: CGPoint(x: (rect.width - topWidth) / 2, y: 0))
        path.addLine(to: CGPoint(x: rect.width - (rect.width - topWidth) / 2, y: 0))
        path.addLine(to: CGPoint(x: rect.width - (rect.width - bottomWidth) / 2, y: height))
        path.addLine(to: CGPoint(x: (rect.width - bottomWidth) / 2, y: height))
        path.closeSubpath()
        
        return path
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
