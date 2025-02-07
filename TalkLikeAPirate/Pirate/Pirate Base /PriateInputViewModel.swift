//
//  PriateInputViewModel.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//

import SwiftUI

@Observable
class PriateInputViewModel: ObservableObject {
    
    var status: FetchStatus = .notStarted
    var errorMessage: String?
    var pirateTranslationText: String?
    
    func getPirateTranslation(from text: String) async {
        status = .fetching
        
        let loadingTask = Task {
            try? await Task.sleep(nanoseconds: 3_000_000_000) //2 seconds
        }
        
        do {
            let responseData = try await APIClient().getPirateTranslation(text: text)
            pirateTranslationText = responseData.contents.translated
            await loadingTask.value 
            status = .success
        } catch {
            if !Task.isCancelled {
                errorMessage = "There was an issue getting the pirate translation. Please try again later."
                status = .failure(error: error)
            }
        }
    }
}


