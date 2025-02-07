//
//  PirateInputView.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//

import SwiftUI

struct PirateInputView: View {
    @StateObject var viewModel: PriateInputViewModel
    @Binding var text: String
    @Binding var showEmptyTextAlert: Bool
    @Binding var showErrorAlert: Bool
    @FocusState private var isTextEditorFocused: Bool
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("pirate")
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
                    .background(Color.clear)
                    .frame(maxWidth: .infinity)
                    .frame(height: 220)
                    .cornerRadius(20)
                    .padding(.horizontal, 30)
                    .padding(.top)
                    .toolbar {
                        ToolbarItem(placement: .keyboard) {
                            Button("Done") {
                                isTextEditorFocused = false // Dismiss keyboard
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
                        await viewModel.getPirateTranslation(from: text)
                        if case .failure(_) = viewModel.status {
                            showErrorAlert = true
                        }
                    }
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.piratePink.gradient)
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
    PirateInputView(viewModel: PriateInputViewModel(), text: .constant(""), showEmptyTextAlert: .constant(false), showErrorAlert: .constant(false))
}
