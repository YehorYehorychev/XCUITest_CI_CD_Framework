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
        app.launch()

        app.buttons["loginBtn"].tap()

        let expectedErrorText = "Email and password should not be empty"
        let errorMessageElement = app.staticTexts[expectedErrorText]

        XCTAssertTrue(errorMessageElement.exists, "Error message is not shown")
        XCTAssertEqual(errorMessageElement.label, expectedErrorText)
    }

    func testSuccessfulAuthorization() {
        app.launch()
        
        // Test data
        let email = "eve.holt@reqres.in"
        let password = "cityslicka"

        // Locators -> Login page
        let emailField = app.textFields["emailField"]
        let passwordField = app.textFields["passField"]
        let loginBtn = app.buttons["loginBtn"]

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
    
    func testUnsuccessfulAuthorization() {
        app.launch()
        
        // Test data
        let wrongEmail = "test@mail.com"
        let wrongPassword = "test4u"

        // Locators -> Login page
        let emailField = app.textFields["emailField"]
        let passwordField = app.textFields["passField"]
        let loginBtn = app.buttons["loginBtn"]
        
        emailField.tap()
        emailField.typeText(wrongEmail)
        
        passwordField.tap()
        passwordField.typeText(wrongPassword)
        
        loginBtn.tap()
        
        let alertWindow = app.alerts["Try Again"]
        XCTAssertTrue(alertWindow.waitForExistence(timeout: 5.0), "Alert didn't appear")
        
        let isInvalidCredsAlertExist = app.alerts.staticTexts["Invalid credentials"].exists
        XCTAssertTrue(isInvalidCredsAlertExist)
    }
}
