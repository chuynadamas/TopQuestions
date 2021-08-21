//
//  File.swift
//  DetailQuestionViewController
//
//  Created by Jesus Cruz on 25/06/21.
//

import UIKit
import Combine
import TopQuestionsKit

class DetailQuestionViewController: UIViewController {
    
    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var questionTagLabels: UILabel!
    @IBOutlet weak var questionTimeStampLabel: UILabel!
    @IBOutlet weak var questionUpLabel: UILabel!
    @IBOutlet weak var questionCommentsLabel: UILabel!
    @IBOutlet weak var questionViewsLabel: UILabel!
    @IBOutlet weak var questionDescriptionLabel: UILabel!
    @IBOutlet weak var questionProfileImage: UIImageView!
    @IBOutlet weak var questionAuthorLabel: UILabel!
    @IBOutlet weak var authorPointsLabel: UILabel!
    

    private var subscriptions = Set<AnyCancellable>()
    
    var question: Question?
    var questionDataModel: QuestionDataModel?
    
    override func viewDidLoad() {
        title = "Question"
        setUp()
        questionDataModel = QuestionDataModel(question: question!)
        questionDataModel?.$isLoading.sink(receiveValue: { isLoading in
            guard let questionValue = self.questionDataModel?.question,
                  let ownerVaue = questionValue.owner,
                  !isLoading else {
                return
            }
            self.question = questionValue
            self.questionProfileImage.image = ownerVaue.profileImage
            self.setUp()
        }).store(in: &subscriptions)
        
        questionDataModel?.loadQuestion()
    }
    
    func setUp() {
        guard let question = self.question else {
            return
        }
        questionTitleLabel.text = question.title
        questionTagLabels.text = question.tags.joined(separator: ", ")
        questionTimeStampLabel.text = question.date.formatted
        questionUpLabel.text = "🆙 \(question.score.thousandsFormatting)"
        questionCommentsLabel.text = "💬 \(question.answerCount.thousandsFormatting)"
        questionViewsLabel.text = "👀 \(question.viewCount.thousandsFormatting)"
        questionDescriptionLabel.text = question.body
        questionAuthorLabel.text = question.owner?.name
        authorPointsLabel.text = "\(question.owner?.reputation?.thousandsFormatting ?? "")"
    }
}
