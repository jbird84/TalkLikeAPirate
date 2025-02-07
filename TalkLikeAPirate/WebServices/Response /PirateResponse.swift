//
//  PirateResponse.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//


struct PirateResponse: Codable {
    let success: PirateSuccess
    let contents: PirateContents
}

struct PirateSuccess: Codable {
    let total: Int
}

struct PirateContents: Codable {
    let translated: String
    let text: String
    let translation: String
}
