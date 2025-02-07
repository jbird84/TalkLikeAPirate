//
//  APIClient.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//

import Foundation

public class APIClient {
    
    public init() {}
    
        enum APIClientMethod: String {
        case get
        case post
        case update
        case delete
    }
    
    static func dataRequest<T: Decodable>(endpoint: String, method: APIClientMethod, parameter: [String: Any]? = nil, headers: [String: String]? = nil, authToken: String? = nil, forObject object: T.Type) async throws -> T {
        
        guard var urlComponents = URLComponents(string: endpoint) else {
            throw APIClientError.invalidURL
        }
        
        if let params = parameter, method == .get {
            urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        guard let url = urlComponents.url else {
            throw APIClientError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        if let params = parameter, method == .post {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params)
        }
        
        request.httpMethod = method.rawValue
        
        if let authToken = authToken {
            request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }
        
        headers?.forEach({ key, value in
            request.addValue(value, forHTTPHeaderField: key)
        })
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIClientError.failed(reason: "No HTTPURLResponse")
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            //TODO: Handle different status codes per your needs
            throw APIClientError.failed(reason: "HTTP status code \(httpResponse.statusCode)")
        }
        
        do {
            let decoder = JSONDecoder()
            print("Endpoint fired is: \(endpoint)")
            
            return try decoder.decode(T.self, from: data)
        }
        catch {
            //TODO: create a way to show errors based on your app:
            let dataString = String(data: data, encoding: .utf8) ?? "Invalid Data"
            print("FAILED decoding data from endpoint: \(endpoint) with error: \(dataString)")
            throw APIClientError.failed(reason: "Failed to decode JSON: \(error), DATA: \(dataString)")
        }
    }
}


public enum APIClientError: Error {
    case invalidURL
    case encodingError
    case decodingError
    case urlSessionError(Error)
    case httpError(Int)
    case failed(reason: String)
}
