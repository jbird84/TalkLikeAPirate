//
//  PriateBaseView.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//

import SwiftUI

struct PriateBaseView: View {
    
    @StateObject var viewModel = PriateInputViewModel()
    @State private var text = ""
    @State private var showEmptyTextAlert = false
    @State private var showErrorAlert = false
    @State private var navigateToTranslation = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.status {
                case .fetching:
                    PirateShipSpinnerView()
                case .success:
                    if let _ = viewModel.pirateTranslationText {
                        Color.clear
                            .onAppear {
                                navigateToTranslation = true
                            }
                    }
                default:
                    PirateInputView(viewModel: viewModel, text: $text, showEmptyTextAlert: $showEmptyTextAlert, showErrorAlert: $showErrorAlert)
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
                if let translation = viewModel.pirateTranslationText {
                    PirateTranslationView(translatedText: translation) {
                        viewModel.status = .notStarted
                        navigateToTranslation = false
                        text = ""
                    }
                }
            }
        }
    }
}

//#Preview {
//    PriateBaseView()
//}
