//
// BaseView.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//

import SwiftUI

struct BaseView: View {
    
    @StateObject var viewModel = InputViewModel()
    @State private var text = ""
    @State private var showEmptyTextAlert = false
    @State private var showErrorAlert = false
    @State private var navigateToTranslation = false
    
    var spinnerViewImageName: String
    var spinnerViewText: String
    var characterName: String
    var inputViewGenerateButtonColor: Color
    
    var body: some View {
        VStack {
            switch viewModel.status {
            case .fetching:
                SpinnerView(spinningImageName: spinnerViewImageName, translatingText: spinnerViewText)
            case .success:
                if let _ = viewModel.translationText {
                    Color.clear
                        .onAppear {
                            navigateToTranslation = true
                        }
                }
            default:
                InputView(viewModel: viewModel, text: $text, showEmptyTextAlert: $showEmptyTextAlert, showErrorAlert: $showErrorAlert, topImageName: characterName, generateButtonColor: inputViewGenerateButtonColor)
            }
        }
        .background(Color.black.gradient)
        .alert("Error", isPresented: $showErrorAlert) {
            Button("OK", role: .cancel) {
                viewModel.status = .notStarted
            }
        } message: {
            Text(viewModel.errorMessage ?? "Something went wrong.")
        }
        .navigationDestination(isPresented: $navigateToTranslation) {
            if let translation = viewModel.translationText {
                TranslationView(characterName: characterName, translatedText: translation) {
                    viewModel.status = .notStarted
                    navigateToTranslation = false
                    text = ""
                }
            }
        }
    }
}

