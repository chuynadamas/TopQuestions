//
//  QuestionView.swift
//  TopQuestionsSwiftUI
//
//  Created by chuynadamas on 8/21/21.
//

import SwiftUI
import TopQuestionsKit

struct QuestionView: View {
    private var question: Question
    @State var isLoading : Bool = true
    
    init(question: Question) {
        self.question = question
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading) {
                Details(question: question)
                if isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity,
                               alignment: .center)
                } else {
                    if let body = question.body {
                        Text(body)
                    }
                    if let owner = question.owner {
                        Owner(user: owner)
                            .frame(maxWidth: .infinity,
                                   alignment: .trailing)
                    }
                }
            }
            .padding(.horizontal, 20.0)
        }
        .navigationTitle("Detail")
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: TestData.Questions[0])
    }
}
