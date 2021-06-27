//
//  ViewController.swift
//  TopQuestionsUIKit
//
//  Created by Jesus Cruz on 25/06/21.
//

import UIKit
import Combine

class TopQuestionsController: UITableViewController  {
    
    private let cellIdentifier = "questionCellView"
    private let segueIdentifier = "showQuestionDetail"
    
    private var dataModel = QuestionsDataModel()
    private var questions : [Question] = []
    
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        title = "Top Questions"
        
        setUp()
    }
    
    func setUp() {
        dataModel.fetchTopQuestions()
        dataModel.$questions.sink { [weak self] value in
            self?.questions = value
            self?.tableView.reloadData()
        }.store(in: &subscriptions)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! QuestionCellView
        cell.accessoryType = .disclosureIndicator
        cell.update(with: questions[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            if let targetController = segue.destination as? DetailQuestionViewController {
                if let index = self.tableView.indexPathForSelectedRow?.row {
                    targetController.question = questions[index]
                }
            }
        }
    }
    
}
