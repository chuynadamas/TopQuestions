//
//  CellView.swift
//  TopQuestionsUIKit
//
//  Created by Jesus Cruz on 25/06/21.
//

import UIKit
import TopQuestionsKit

class QuestionCellView: UITableViewCell {
    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var questionTagsLabel: UILabel!
    @IBOutlet weak var questionTimeStampLabel: UILabel!
    @IBOutlet weak var questionsUpsLabel: UILabel!
    @IBOutlet weak var questionsCommentsLabel: UILabel!
    @IBOutlet weak var questionsViewLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func update(with question: Question) {
        questionTitleLabel?.text = question.title
        questionTagsLabel?.text = question.tags.joined(separator: ", ")
        questionTimeStampLabel?.text = question.date.formatted
        questionsUpsLabel?.text = "🆙 \(question.score.thousandsFormatting)"
        questionsCommentsLabel?.text = "💬 \(question.answerCount.thousandsFormatting)"
        questionsViewLabel?.text = "👀 \(question.viewCount.thousandsFormatting)"
    }
}
