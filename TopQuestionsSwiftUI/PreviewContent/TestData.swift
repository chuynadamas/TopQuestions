//
//  TopQuestionsSwiftUIApp.swift
//  Shared
//
//  Created by chuynadamas on 8/21/21.
//

import Foundation
@testable import TopQuestionsKit

struct TestData {
    
    static let user = User(name: "Lumir Sacharov", reputation: 2345, profileImageURL: nil)
    
	static var Questions: [Question] = {
		let questions = [
            Question(id: 0, score: 0, answerCount: 0, viewCount: 0, title: "Foo", body: nil, date: Date(), tags: [""], owner: user),
            Question(id: 0, score: 0, answerCount: 0, viewCount: 0, title: "Foo", body: nil, date: Date(), tags: [""], owner: user)
        ]
        return questions
	}()
}
