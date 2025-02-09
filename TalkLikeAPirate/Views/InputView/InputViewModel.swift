//
//  InputViewModel.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//

import SwiftUI

@Observable
class InputViewModel: ObservableObject {
    
    var status: FetchStatus = .notStarted
    var errorMessage: String?
    var translationText: String?
    
    func getTranslation(of text: String, with character: String) async {
        status = .fetching
        
        let loadingTask = Task {
            try? await Task.sleep(nanoseconds: 3_000_000_000) //3 seconds
        }
        
        do {
            let responseData = try await APIClient().getTranslation(of: text, with: character)
            translationText = responseData.contents.translated
            await loadingTask.value
            status = .success
        } catch {
            if !Task.isCancelled {
                errorMessage = "There was an issue getting the translation. Please try again later."
                status = .failure(error: error)
            }
        }
    }
}


