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
        let percent : Double = Double(numCorrect)/Double(total)
        if percent == 1.0 {
            gradeDescription = "Perfect!"
            grade = "You got \(numCorrect) out of \(total) correct."
        } else if percent >= 0.8 {
            gradeDescription = "Not bad!"
            grade = "You got \(numCorrect) out of \(total) correct."
        } else if percent >= 0.5 {
            gradeDescription = "Could use some work."
            grade = "You got \(numCorrect) out of \(total) correct."
        } else {
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
        myBackButton.setTitleColor(UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.9), forState: UIControlState.Normal)
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
