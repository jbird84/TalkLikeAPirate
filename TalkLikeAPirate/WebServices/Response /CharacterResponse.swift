//
//  CharacterResponse.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//


struct CharacterResponse: Codable {
    let success: CharacterSuccess
    let contents: CharacterContents
}

struct CharacterSuccess: Codable {
    let total: Int
}

struct CharacterContents: Codable {
    let translated: String
    let text: String
    let translation: String
}
