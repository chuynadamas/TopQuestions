//
//  Question.swift
//  TopQuestionsUIKit
//
//  Created by Jesus Cruz on 26/06/21.
//

import Foundation


//MARK: - Items
public struct Items : Codable {
    var items : [Question]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}

// MARK: - Question
public struct Question: Identifiable, Codable {
    public let id: Int
    public let score: Int
    public let answerCount: Int
    public let viewCount: Int
    public let title: String
    public let body: String?
    public let date: Date
    public let tags: [String]
    public var owner: User?
    
    enum CodingKeys: String, CodingKey {
        case score
        case title
        case body
        case tags
        case owner
        case id   = "question_id"
        case date = "creation_date"
        case answerCount = "answer_count"
        case viewCount   = "view_count"
    }
}

