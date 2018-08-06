//
//  ShopUITests.swift
//  ShopUITests
//
//  Created by Laptev Sasha on 02/07/2018.
//  Copyright © 2018 Laptev Sasha. All rights reserved.
//

import XCTest

class ShopUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAuth() {
        let scrollViews = app.scrollViews
        
        let loginTextField = scrollViews.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText("123")
        
        let passwordTextField = scrollViews.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("123")
        
        let loginButton = scrollViews.buttons["loginButton"]
        loginButton.tap()
    }
    
    func testLogOut() {
        let scrollViews = app.scrollViews
        
        let loginTextField = scrollViews.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText("123")
        
        let passwordTextField = scrollViews.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("123")
        
        let loginButton = scrollViews.buttons["loginButton"]
        loginButton.tap()
        
        app.wait(for: XCUIApplication.State.runningBackground, timeout: 150)
        let bar = app.tabBars
        bar.buttons["logout"].tap()
    }
    
    func testRegister() {
        let scrollViews = app.scrollViews
        
        let registerButton = scrollViews.buttons["RegisterButton"]
        
        registerButton.tap()
        
        let loginTextField = scrollViews.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText("123")
        
        let passwordTextField = scrollViews.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("123")
        
        let loginButton = scrollViews.buttons["RegisterButton"]
        loginButton.tap()
    }
}
