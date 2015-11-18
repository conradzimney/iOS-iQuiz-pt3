//
//  iQuizUITests.swift
//  iQuizUITests
//
//  Created by Conrad Zimney on 11/1/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import XCTest

class iQuizUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        /*
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Marvel Super Heroes"].tap()
        tablesQuery.cells.containingType(.StaticText, identifier:"Mathematics").staticTexts["Desc:"].tap()
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        tablesQuery.staticTexts["Marvel Super Heroes Quiz!"].tap()
        tablesQuery.staticTexts["Science Quiz!"].tap()
        tablesQuery.staticTexts["Mathematics Quiz!"].tap()
        
        let quizzesNavigationBar = app.navigationBars["Quizzes"]
        quizzesNavigationBar.buttons["Take the Quiz!"].tap()
        tablesQuery.staticTexts["23"].tap()
        app.navigationBars["Mathematics Quiz"].buttons["Next"].tap()
        
        let nextQuestionButton = app.buttons["Next Question"]
        nextQuestionButton.tap()
        tablesQuery.staticTexts["53"].tap()
        tablesQuery.staticTexts["5"].tap()
        
        let nextButton = app.navigationBars["Quiz"].buttons["Next"]
        nextButton.tap()
        nextQuestionButton.tap()
        tablesQuery.staticTexts["99"].tap()
        nextButton.tap()
        nextQuestionButton.tap()
        tablesQuery.staticTexts["x"].tap()
        nextButton.tap()
        nextQuestionButton.tap()
        app.otherElements.containingType(.NavigationBar, identifier:"iQuiz.FinishedView").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.tap()
        app.buttons["Finish"].tap()
        quizzesNavigationBar.buttons["Settings"].tap()
        
        let okButton = app.alerts["Settings"].collectionViews.buttons["OK"]
        okButton.tap()
        okButton.tap()
        okButton.tap()
        okButton.tap()
        okButton.tap()
        okButton.tap()
        
        let settingsElement = app.otherElements.containingType(.Alert, identifier:"Settings").element
        settingsElement.tap()
        settingsElement.tap()
        settingsElement.tap()
    */
        
    }
    
}

