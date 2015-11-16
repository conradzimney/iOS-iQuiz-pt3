//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/9/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {

    // General Variables and UI Outlets //
    
    var numCorrect = 0
    var total = 4
    var gradeDescription = ""
    var grade = ""
    
    @IBOutlet weak var gradeDescLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    // General State Controller Stuff // 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch numCorrect {
        case 4:
            gradeDescription = "Perfect!"
            grade = "You got \(numCorrect) out of \(total) correct."
        case 3:
            gradeDescription = "Not bad!"
            grade = "You got \(numCorrect) out of \(total) correct."
        case 2:
            gradeDescription = "50% is still an F..."
            grade = "You got \(numCorrect) out of \(total) correct."
        case 1:
            gradeDescription = "Not very good."
            grade = "You got \(numCorrect) out of \(total) correct."
        default:
            gradeDescription = "You need some serious improvement..."
            grade = "You got \(numCorrect) out of \(total) correct."
        }
        gradeDescLabel?.text = gradeDescription
        gradeLabel?.text = grade
        
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

}
