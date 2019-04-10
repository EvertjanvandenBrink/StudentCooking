//
//  StudentCoockingUITests.swift
//  StudentCoockingUITests
//
//  Created by Evertjan van den Brink on 22/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import XCTest

class StudentCoockingUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_welcomesTextExists() {
        app.launch()
        XCTAssert(app.staticTexts["Welcome"].exists)
    }
    
    func test_scannerViewOpensOnButtonTab() {
        app.launch()
        
        app.buttons["Start scanning"].tap()
        XCTAssertEqual(app.navigationBars.element.identifier, "Scanner")
    }
    
    func test_openRecipesTableViewFromTabbar() {
        app.launch()
        app.tabBars.buttons["Recipes"].tap()
        XCTAssertEqual(app.navigationBars.element.identifier, "Recipes")
    }
}
