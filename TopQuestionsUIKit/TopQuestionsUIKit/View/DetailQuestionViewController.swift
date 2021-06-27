//
//  File.swift
//  DetailQuestionViewController
//
//  Created by Jesus Cruz on 25/06/21.
//

import UIKit

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
    

    var question: Question?
    
    override func viewDidLoad() {
        title = "Question"
        setUp()
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
