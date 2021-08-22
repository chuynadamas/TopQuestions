//
//  Details.swift
//  TopQuestionsSwiftUI
//
//  Created by chuynadamas on 8/21/21.
//

import SwiftUI
import TopQuestionsKit

struct Details: View {
    let question: Question
    
    private var tags: String {
        question.tags[0] + question.tags.dropFirst().reduce("") { $0 + ", " + $1 }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(question.title)
                .font(.headline)
            Text(tags)
                .font(.footnote)
                .bold()
                .foregroundColor(.accentColor)
            Text(question.date.formatted)
                .font(.caption)
                .foregroundColor(.secondary)
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Label("\(question.score.thousandsFormatting)", systemImage: "arrowtriangle.up.circle")
                Label("\(question.answerCount.thousandsFormatting)", systemImage: "ellipses.bubble")
                    .padding(.leading, 108.0)
                Label("\(question.answerCount.thousandsFormatting)", systemImage: "eye")
                    .padding(.leading, 204.0)
            }
            .foregroundColor(.teal)
        }
        .padding(.top, 24.0)
        .padding(.bottom, 16.0)
    }
}

struct TopQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        Details(question: TestData.Questions[0])
            .previewLayout(.sizeThatFits)
    }
}
