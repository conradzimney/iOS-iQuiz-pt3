//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/17/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var quizzes : [NSDictionary] = [NSDictionary]()
    
    var USING_LOCAL_DATA : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textBox.text = "https://tednewardsandbox.site44.com/questions.json"
    }
    
    @IBOutlet weak var textBox: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func checkNow(sender: UIButton) {
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
                self.quizzes = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [NSDictionary]
                self.USING_LOCAL_DATA = false
            } catch {
                print("Something didn't work...")
                self.USING_LOCAL_DATA = true
            }
        }
        task.resume()
    }
    
    @IBAction func useLocalData(sender: AnyObject) {
        self.USING_LOCAL_DATA = true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "UnwindSegue" {
            if let destinationVC = segue.destinationViewController as? ViewController {
                destinationVC.loadedQuizzes = quizzes
                destinationVC.USING_LOCAL_DATA = self.USING_LOCAL_DATA
            }
        }
    }
    
}
