//
//  InputView.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//

import SwiftUI

struct InputView: View {
    @StateObject var viewModel: InputViewModel
    @Binding var text: String
    @Binding var showEmptyTextAlert: Bool
    @Binding var showErrorAlert: Bool
    @FocusState private var isTextEditorFocused: Bool
    
    var topImageName: String
    var generateButtonColor: Color
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(topImageName)
                    .resizable()
                    .frame(width: 400, height: 400)
                    .padding(.top, 10)
                Spacer()
            }
            
            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text("Type yer text here...")
                        .foregroundColor(.gray)
                        .padding(.horizontal, 35)
                        .padding(.top, 25)
                        .zIndex(1)
                }
                
                TextEditor(text: $text)
                    .focused($isTextEditorFocused)
                    .scrollContentBackground(.hidden)
                    .foregroundColor(.black)
                    .background(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 220)
                    .cornerRadius(20)
                    .padding(.horizontal, 30)
                    .padding(.top)
                    .toolbar {
                        ToolbarItem(placement: .keyboard) {
                            Button("Dismiss Keyboard") {
                                isTextEditorFocused = false
                            }
                        }
                    }
            }
            
            Spacer()
            
            Button {
                if text.isEmpty {
                    showEmptyTextAlert = true
                } else {
                    Task {
                        let characterJSON = "\(topImageName).json"
                        await viewModel.getTranslation(of: text, with: characterJSON)
                        if case .failure(_) = viewModel.status {
                            showErrorAlert = true
                        }
                    }
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(generateButtonColor.gradient)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                    Text("Generate!")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .alert("Text cannot be empty.", isPresented: $showEmptyTextAlert) {}
            }
            .padding(.bottom, 20)
            .padding(.horizontal, 30)
        }
        .onTapGesture {
            isTextEditorFocused = false
        }
    }
}

#Preview {
    InputView(viewModel: InputViewModel(), text: .constant(""), showEmptyTextAlert: .constant(false), showErrorAlert: .constant(false), topImageName: "pig", generateButtonColor: .pigPink)
}
