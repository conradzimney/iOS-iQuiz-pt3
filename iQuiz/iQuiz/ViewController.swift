//
//  ViewController.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/1/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Local Data Questions and Answers //
    
    var loadedQuizzes : [AnyObject] = []
    
    let topics = [
        ["Subject" : "Mathematics", "Description" : "Mathematics Quiz!"],
        ["Subject" : "Marvel Super Heroes", "Description" : "Marvel Super Heroes Quiz!"],
        ["Subject" : "Science", "Description" : "Science Quiz!"]
    ]
    
    let mathQuestions = ["What is 2 + 2?","What is 45 / 9?","What is 9 * 11?", "What is 55-35?"]
    let mathAnswers = [
        ["4","23","9","6"],
        ["53","5","45","21"],
        ["-1","67","99","100"],
        ["x","y","23","20"]
    ]
    let heroQuestions = ["Who wears a blue 'S' on their chest?","Who is a nocturnal flying mammal hero?","Who is the male arachnid hero?","Who is the big green hero?"]
    let heroAnswers = [
        ["Superman","Thor","Spiderman","Ironman"],
        ["Ironman","Batman","Wolverine","The Incredible Hulk"],
        ["Black Widow","Batman","Spiderman","Loki"],
        ["Superman","Captain Marvel","Hawk Eye","The Incredible Hulk"]
    ]
    let scienceQuestions = ["What is the element with Atomic Name 'C'?","What is the element with Atomic Number 1?","Atom with different number of neutrons?","What is the Atomic Number of Helium?"]
    let scienceAnswers = [
        ["Carbon","Cesium","Californium","Calcium"],
        ["Helium","Hydrogen","Isotope","Boron"],
        ["Atom","Molecule","Isotope","Bond"],
        ["4","1","3","2"]
    ]
    
    // General UI and ViewController Stuff // 
    
    var selectedSubject = ""
    let cellTableIdentifier = "CellTableIdentifier"
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(QuizCell.self, forCellReuseIdentifier: cellTableIdentifier)
        print("Loadeds Quizzes: \(loadedQuizzes)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Button Functions //
    
    @IBAction func takeThisQuiz(sender: AnyObject) {
        print("Loadeds Quizzes: \(loadedQuizzes)")
        if selectedSubject == "" {
            let message = "Please select a quiz"
            let controller = UIAlertController(title: "Error",
                message: message, preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK",
                style: .Default, handler: nil)
            controller.addAction(action)
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    // Segue functions //
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowQuestionSegue" {
            if let destinationVC = segue.destinationViewController as? QuestionViewController {
                destinationVC.subject = selectedSubject
                switch selectedSubject {
                    case "Mathematics":
                        destinationVC.questions = mathQuestions
                        destinationVC.answers = mathAnswers
                    case "Marvel Super Heroes":
                        destinationVC.questions = heroQuestions
                        destinationVC.answers = heroAnswers
                    case "Science":
                        destinationVC.questions = scienceQuestions
                        destinationVC.answers = scienceAnswers
                default:
                    destinationVC.questions = []
                    destinationVC.answers = []
                }
            }
        }
        if segue.identifier == "ShowSettingsSegue" {
            if let destinationVC = segue.destinationViewController as? SettingsViewController {
                // prepare unwoundToMVC, no data to send to settings...
            }
        }
    }
    
    @IBAction func goBack(segue : UIStoryboardSegue) {
        print("Someone came back to me!")
        print("Loadeds Quizzes: \(loadedQuizzes)")
    }
    
    // Table View stuff //
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!)! as! QuizCell
        selectedSubject = currentCell.subject
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return topics.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath) as! QuizCell
        let imageView = UIImageView(frame: CGRectMake(10, 10, 5, 5))
        let image = UIImage(named: "quiz")
        imageView.image = image
        cell.imageView?.image = image
        let rowData = topics[indexPath.row]
        cell.subject = rowData["Subject"]!
        cell.desc = rowData["Description"]!
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
}

