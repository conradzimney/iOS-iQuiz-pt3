//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/9/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    // General Variables and UI Outlets //
    
    var questions = [String]()
    var answers = [Array<String>()]
    var done = false
    var chosenAnswer = ""
    var correctAnswer = ""
    var question = ""
    var questionNumber = 0
    var numCorrect = 0
    var correctAnswerNumberArray : [Int] = []

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    @IBOutlet weak var yourAnswerLabel: UILabel!
    
    @IBOutlet weak var correctnessLabel: UILabel!

    // View Controller Functions //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        questionLabel.text = question
        yourAnswerLabel.text = "Your answer: \(chosenAnswer)"
        correctAnswerLabel.text = "Correct answer: \(correctAnswer)"
        if answers[questionNumber][correctAnswerNumberArray[questionNumber]] == chosenAnswer {
            correctnessLabel.text = "Correct!"
            numCorrect++
        } else {
            correctnessLabel.text = "Incorrect..."
        }
        if questionNumber == questions.count-1 {
            done = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Segue and Button Controllers //
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowQuestionSegue" {
            if let destinationVC = segue.destinationViewController as? QuestionViewController {
                destinationVC.questionNumber = questionNumber + 1
                destinationVC.questions = questions
                destinationVC.answers = answers
                destinationVC.numCorrect = numCorrect
                destinationVC.correctAnswerNumberArray = correctAnswerNumberArray
            }
        } else if segue.identifier == "ShowFinishedSegue" {
            if let destinationVC = segue.destinationViewController as? FinishedViewController {
                destinationVC.numCorrect = numCorrect
                destinationVC.total = questions.count
            }
        }
    }
    
    @IBAction func goToNextQuestion(sender: UIButton) {
        if done {
            self.performSegueWithIdentifier("ShowFinishedSegue", sender: nil)
        } else {
            self.performSegueWithIdentifier("ShowQuestionSegue", sender: nil)

        }
    }

}
