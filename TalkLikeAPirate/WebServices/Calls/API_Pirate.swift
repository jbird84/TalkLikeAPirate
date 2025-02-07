//
//  API_Pirate.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//

import Foundation
import OSLog

extension APIClient {
    
    
    /// Fetches a pirate-themed translation for a given text using the Fun Translations API.
        ///
        /// This method constructs a GET request to the API endpoint, adding the input text as a query parameter.
        /// The API responds with a JSON object containing the translated text.
        ///
        /// - Parameter text: The input string to be translated into pirate language.
        /// - Returns: A `PirateResponse` object containing the translated text.
        /// - Throws: An `APIClientError` if the request fails or the response cannot be decoded.
     func getPirateTranslation(text: String) async throws -> PirateResponse {
        let logger = OSLog(subsystem: Constants.bundleName, category: "Fetching Pirate Translation")
        let endpoint = Endpoints.baseURL
        let params: [String: Any] = ["text": text]
        
        do {
            let responseData: PirateResponse = try await APIClient.dataRequest(endpoint: endpoint, method: .get, parameter: params, forObject: PirateResponse.self)
            
            return responseData
        } catch {
            os_log("Failed to fetch Pirate Translation: %@", log: logger, type: .error, String(describing: error))
            if let apiError = error as? APIClientError, case let .failed(reason) = apiError {
                os_log("APIError: %@", log: logger, type: .error, reason)
            } else {
                os_log("Unexpected error: %@", log: logger, type: .error, error.localizedDescription)
            }
            throw error
        }
    }
}
