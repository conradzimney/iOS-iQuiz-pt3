//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/17/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var quizzes : [AnyObject] = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textBox.text = "https://tednewardsandbox.site44.com/questions.json"
    }
    
    @IBOutlet weak var textBox: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func checkNow(sender: UIButton) {
        // fire NSURL session here
        let newURL = self.textBox.text
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        let URL = NSURL(string: newURL!) // get text from box
        let request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            let statusCode = (response as! NSHTTPURLResponse).statusCode
            print("URL Task Worked: \(statusCode)")
            do {
                self.quizzes = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
            } catch {
                // report an error
                print("Something didn't work...")
            }
        }
        task.resume()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SettingCloseSegue" {
            if let destinationVC = segue.destinationViewController as? ViewController {
                destinationVC.loadedQuizzes = quizzes
            }
        }
    }
    
}
