//
//  ViewController.swift
//  TopQuestionsUIKit
//
//  Created by Jesus Cruz on 25/06/21.
//

import UIKit

class TopQuestionsController: UITableViewController  {
    
    let cellIdentifier = "questionCellView"
    let segueIdentifier = "showQuestionDetail"
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! QuestionCellView
        cell.quesitionTitleLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum nulla sem, a tristique risus lacinia eget. Mauris placerat nulla in urna malesuada mollis. Mauris consequat scelerisque est non finibus. Ut purus eros, cursus quis posuere eget, malesuada ac neque"
        cell.questionTagsLabel.text = "objc, xcode, swift"
        cell.questionTimeStampLabel.text = "Asked on Sep 15th, 2021"
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            if let destVC = segue.destination as? UINavigationController,
               let targetController = destVC.topViewController as? DetailQuestionViewController {
                targetController.title = "Detailed Question"
            }
        }
    }
    
}
