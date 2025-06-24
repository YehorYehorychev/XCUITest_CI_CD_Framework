//
//  ThreadQAUITests.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/20/25.
//

import XCTest

final class ThreadQAUITests: XCTestCase {

    // Simple/dummy UI test example
    @MainActor
    func testLoginBtnErrorMessageAssertion() {
        let app = XCUIApplication()
        app.launch()

        app.buttons["loginBtn"].tap()

        let expectedErrorText = "Email and password should not be empty"
        let errorMessageElement = app.staticTexts[expectedErrorText]

        XCTAssertTrue(errorMessageElement.exists, "Error message is not shown")
        XCTAssertEqual(errorMessageElement.label, expectedErrorText)
    }

    func testSuccessfulAuthorization() {
        let app = XCUIApplication()
        app.launch()
        
        // Test data
        var email = "eve.holt@reqres.in"
        var password = "cityslicka"
        
        // Locators
        let emailField = app.textFields["emailField"]
        let passwordField = app.textFields["passField"]
        let loginBtn = app.buttons["loginBtn"]
        
        emailField.typeText(email)
        passwordField.typeText(password)
        loginBtn.tap()
    }
}
