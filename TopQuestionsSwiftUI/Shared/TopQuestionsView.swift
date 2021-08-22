//
//  TopQuestionsView.swift
//  Shared
//
//  Created by chuynadamas on 8/21/21.
//

import SwiftUI
import TopQuestionsKit

struct TopQuestionsView: View {
    @StateObject private var dataModel = QuestionsDataModel()
    
    var body: some View {
        List(dataModel.questions) { question in
            NavigationLink(destination: QuestionView(question: question)) {
                Details(question: question)
            }
        }
        .navigationTitle("Top Questions")
        .onAppear {
            dataModel.fetchTopQuestions()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TopQuestionsView()
    }
}
