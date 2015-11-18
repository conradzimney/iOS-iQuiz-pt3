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
    
    let topics = [
        ["title" : "Mathematics", "desc" : "Mathematics Quiz!"],
        ["title" : "Marvel Super Heroes", "desc" : "Marvel Super Heroes Quiz!"],
        ["title" : "Science", "desc" : "Science Quiz!"]
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
    
    // Network Derived Data // 
    
    var loadedQuizzes : [AnyObject] = []
    
    var USING_LOCAL_DATA : Bool = true
    
    // General UI and ViewController Stuff // 
    
    var selectedSubject = ""
    let cellTableIdentifier = "CellTableIdentifier"
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(QuizCell.self, forCellReuseIdentifier: cellTableIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Segue functions //
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowQuestionSegue" {
            if let destinationVC = segue.destinationViewController as? QuestionViewController {
                destinationVC.subject = selectedSubject
                if USING_LOCAL_DATA {
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
                } else {
                    // Using dynamically loaded network data
                    // destinationVC.questions = 
                    // destinationVC.answers = 
                    // destinatioVC.answer =
                    
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
        // ViewController was Unwound to (from Settings View Controller)
        self.tableView.reloadData()
        if loadedQuizzes.count != 0 {
            USING_LOCAL_DATA = false
        }
        print("\(loadedQuizzes)")
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
        if USING_LOCAL_DATA {
            let rowData = topics[indexPath.row]
            cell.subject = rowData["title"]!
            cell.desc = rowData["desc"]!
        } else {
            if let quizzes = loadedQuizzes as? [NSDictionary] {
                if let title = quizzes[indexPath.row]["title"] as? String {
                    if let desc = quizzes[indexPath.row]["desc"] as? String {
                        cell.subject = title
                        cell.desc = desc
                    }
                }
            }
        }
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    
    /*
    let localQuizData = [
    { "title" :"Mathematics",
    desc: "Mathematics Quiz!",
    "questions" : [
    {
    "text": "What is 2 + 2?",
    "answer" : 1,
    "answers": ["4","23","9","6"]
    }, {
    "text": "What is 45 / 9?",
    "answer" : 2,
    "answers": ["53","5","45","21"]
    }, {
    "text": "What is 9 * 11?",
    "answer" : 3,
    "answers": ["-1","67","99","100"]
    }, {
    "text": "What is 55-35?",
    "answer" : 4,
    "answers": ["x","y","23","20"]
    }
    ]
    },
    { "title": "Mathematics",
    "desc": "Mathematics Quiz!",
    "questions" : [
    {
    "text": "What is 2 + 2?",
    "answer" : 1,
    "answers": ["4","23","9","6"]
    }, {
    "text": "What is 45 / 9?",
    "answer" : 2,
    "answers": ["53","5","45","21"]
    }, {
    "text": "What is 9 * 11?",
    "answer" : 3,
    "answers": ["-1","67","99","100"]
    }, {
    "text": "What is 55-35?",
    "answer" : 4,
    "answers": ["x","y","23","20"]
    }
    ]
    },
    { "title": "Mathematics",
    "desc": "Mathematics Quiz!",
    "questions" : [
    {
    "text": "What is 2 + 2?",
    "answer" : 1,
    "answers": ["4","23","9","6"]
    }, {
    "text": "What is 45 / 9?",
    "answer" : 2,
    "answers": ["53","5","45","21"]
    }, {
    "text": "What is 9 * 11?",
    "answer" : 3,
    "answers": ["-1","67","99","100"]
    }, {
    "text": "What is 55-35?",
    "answer" : 4,
    "answers": ["x","y","23","20"]
    }
    ]
    }
    ]
    */
}




