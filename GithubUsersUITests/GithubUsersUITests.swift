//
//  GithubUsersUITests.swift
//  GithubUsersUITests
//
//  Created by C100-105 on 15/03/21.
//

import XCTest

class GithubUsersUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tableView = app.tables.containing(.table, identifier: "userListTable")
        sleep(5)
        
        let cell = tableView.cells.element(boundBy: 0)
        cell.tap()
        
        app.textViews["notesTextView"].tap()
        app.textViews["notesTextView"].typeText("This is written through UITest")
        
        app.buttons["Save"].tap()
        
        /*let exists = NSPredicate(format: "exists == 1")
         let noteUpdated = app.staticTexts["Note updated"]
         expectation(for: exists, evaluatedWith: noteUpdated, handler: nil)
         waitForExpectations(timeout: 50, handler: nil)*/
        sleep(2)
        app.navigationBars.buttons.element(boundBy: 0).tap()
        sleep(10)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
