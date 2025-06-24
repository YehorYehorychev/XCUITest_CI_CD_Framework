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
        let email = "eve.holt@reqres.in"
        let password = "cityslicka"

        // Locators -> Login page
        let emailField = app.textFields["emailField"]
        let passwordField = app.textFields["passField"]
        let loginBtn = app.buttons["loginBtn"]

        // Actions
        emailField.tap()
        emailField.typeText(email)

        passwordField.tap()
        passwordField.typeText(password)

        loginBtn.tap()
        
        // Locators -> Main page
        let brainBtn = app.buttons["Profile"]
        
        XCTAssertTrue(brainBtn.waitForExistence(timeout: 5.0), "Profile button didn't appear")
        
        // Locators -> Main page
        let profilePhotosCount = app.images.count
        
        XCTAssertEqual(6, profilePhotosCount)
    }
}
