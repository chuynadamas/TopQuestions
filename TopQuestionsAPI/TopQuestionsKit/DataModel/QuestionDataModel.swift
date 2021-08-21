//
//  QuestionDataModel.swift
//  TopQuestionsUIKit
//
//  Created by Jesus Cruz on 25/06/21.
//

import Foundation

public class QuestionDataModel: ObservableObject {
    @Published public var question: Question
    @Published public var isLoading = false
    
    private var questionRequest: APIRequest<QuestionsResource>?
    private var imageRequest: ImageRequest?
    
    public init(question: Question) {
        self.question = question
    }
    
    public func loadQuestion() {
        guard !isLoading else { return }
        isLoading = true
        let resource = QuestionsResource(id: question.id)
        let request = APIRequest(resource: resource)
        self.questionRequest = request
        request.execute { [weak self] questions in
            guard let question = questions?.first else { return }
            self?.question = question
            self?.loadOwnerAvatar()
        }
    }
}

private extension QuestionDataModel {
    func loadOwnerAvatar() {
        guard let url = question.owner?.profileImageURL else { return }
        let imageRequest = ImageRequest(url: url)
        self.imageRequest = imageRequest
        imageRequest.execute { [weak self] image in
            self?.question.owner?.profileImage = image
            self?.isLoading = false
        }
    }
}
