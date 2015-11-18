//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/9/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // General Variables and UI outlets //
    
    var questions = [String]()
    var answers = [Array<String>()]
    
    @IBOutlet weak var quizTitle: UINavigationItem!
    @IBOutlet weak var questionTableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var questionNumber = 0
    var numCorrect = 0
    var subject = ""
    let cellTableIdentifier = "cell"
    var selectedAnswer = ""
    
    // State Controller Stuff //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionTableView.delegate = self
        self.questionTableView.dataSource = self
        quizTitle.title = "\(subject)"
        questionLabel.text = questions[questionNumber]
        
        navigationController!.setNavigationBarHidden(false, animated:true)
        let myBackButton:UIButton = UIButton(type: UIButtonType.Custom) as UIButton
        myBackButton.addTarget(self, action: "popToRoot:", forControlEvents: UIControlEvents.TouchUpInside)
        myBackButton.setTitle("Back", forState: UIControlState.Normal)
        myBackButton.sizeToFit()
        myBackButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        let myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: myBackButton)
        self.navigationItem.leftBarButtonItem = myCustomBackButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Segue Stuff //
    
    func popToRoot(sender:UIBarButtonItem){
        self.navigationController!.popToRootViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowAnswerSegue" {
            if let destinationVC = segue.destinationViewController as? AnswerViewController {
                destinationVC.chosenAnswer = selectedAnswer
                destinationVC.correctAnswer = answers[questionNumber][questionNumber]
                destinationVC.question = questions[questionNumber]
                destinationVC.questionNumber = questionNumber
                destinationVC.questions = questions
                destinationVC.answers = answers
                destinationVC.numCorrect = numCorrect
            }
        }
    }
    
    // TableView Stuff //
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return 4
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!)!
        selectedAnswer = (currentCell.textLabel?.text)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = answers[questionNumber][indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }

}
