//
//  iQuizTests.swift
//  iQuizTests
//
//  Created by Conrad Zimney on 11/1/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import XCTest
@testable import iQuiz

class iQuizTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // example stuff from class
        /*
        let testBundle = NSBundle(forClass: self.dynamicType)
        
        let jsonData = NSData(contentsOfURL: (testBundle.URLForResource("questions", withExtension: "json"))!)
        let quizzes : [AnyObject]
        let quizController = ViewController()
        
        do {
            quizzes = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
            
            XCTAssertEqual(quizController.topics.count, quizzes.count)
        } catch {
            // report an error
        }
        */
    }
    
    func testDownloadTask() {
        
        // THIS IS IMPORTANT FOR COMPLETING THE HOMEWORK
        /*
        let didFinishExpectation = expectationWithDescription("download finished")
        
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        let URL = NSURL(string: "https://tednewardsandbox.site44.com/questions.json")
        
        let request = NSMutableURLRequest(URL: URL!)
        
        request.HTTPMethod = "GET"
        
        var quizzes : [AnyObject] = [AnyObject]()
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            XCTAssertNil(data, "Data should not be nil")
            XCTAssertNil(error, "Error should be nil")
            
            let statusCode = (response as! NSHTTPURLResponse).statusCode
            
            print("URL Task Worked: \(statusCode)")
            
            do {
                quizzes = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
                
                didFinishExpectation.fulfill()
                
            } catch {
                // report an error
            }
            
        }
        task.resume()
        
        self.waitForExpectationsWithTimeout(5.0, handler: nil)
        
        XCTAssertEqual(quizzes.count, 3)
        */
        
    }
    
    
    
    
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
            let testBundle = NSBundle(forClass: self.dynamicType)
            
            let jsonData = NSData(contentsOfURL: testBundle.URLForResource("questions", withExtension: "json")!)
            let quizzes : [AnyObject]
            let quizController = ViewController()
            
            do {
                quizzes = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
                
                XCTAssertEqual(quizController.topics.count, quizzes.count)
            } catch {
                // report an error
            }
        }
    }
    
}
