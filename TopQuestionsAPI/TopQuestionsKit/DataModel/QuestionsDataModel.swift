//
//  QuestionsDataModel.swift
//  TopQuestionsUIKit
//
//  Created by Jesus Cruz on 25/06/21.
//
import Foundation

public class QuestionsDataModel: ObservableObject {
    @Published public private(set) var questions: [Question] = []
    @Published public private(set) var isLoading = false
    
    private var request: APIRequest<QuestionsResource>?
    
    public init (){
    }
    
    public func fetchTopQuestions() {
        guard !isLoading else { return }
        isLoading = true
        let resource = QuestionsResource()
        let request = APIRequest(resource: resource)
        self.request = request
        request.execute { [weak self] questions in
            self?.questions = questions ?? []
            self?.isLoading = false
        }
    }
}
