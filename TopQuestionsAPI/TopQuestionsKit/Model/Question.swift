//
//  Question.swift
//  TopQuestionsUIKit
//
//  Created by Jesus Cruz on 26/06/21.
//

import Foundation

// MARK: - Question
public struct Question: Identifiable {
    public let id: Int
    public let score: Int
    public let answerCount: Int
    public let viewCount: Int
    public let title: String
    public let body: String?
    public let date: Date
    public let tags: [String]
    public var owner: User?
}

extension Question: Decodable {
    enum CodingKeys: String, CodingKey {
        case score, title, body, tags, owner
        case id = "question_id"
        case date = "creation_date"
        case answerCount = "answer_count"
        case viewCount = "view_count"
    }
}

// MARK: - Wrapper
public struct Wrapper<T: Decodable>: Decodable {
    let items: [T]
}
