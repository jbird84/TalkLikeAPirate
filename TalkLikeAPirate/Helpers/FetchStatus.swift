//
//  FetchStatus.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/6/25.
//


enum FetchStatus {
    case notStarted
    case fetching
    case success
    case failure(error: Error)
}
