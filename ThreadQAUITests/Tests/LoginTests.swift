//
//  ThreadQAUITests.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/20/25.
//

import XCTest

final class LoginTests: XCTestCase {
    private var loginScreen = LoginScreen()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
    }

    // Simple/dummy UI test example (no POM)
    @MainActor
    func testLoginBtnErrorMessageAssertion() {
        app.buttons["loginBtn"].tap()

        let expectedErrorText = "Email and password should not be empty"
        let errorMessageElement = app.staticTexts[expectedErrorText]

        XCTAssertTrue(errorMessageElement.exists, "Error message is not shown")
        XCTAssertEqual(errorMessageElement.label, expectedErrorText)
    }

    func testSuccessfulAuthorization() {
        // Test data
        let email = "eve.holt@reqres.in"
        let password = "cityslicka"

        let imagesCount = loginScreen
            .auth(email: email, pass: password)
            .getImagesCound()
        
        XCTAssertEqual(6, imagesCount)
    }
    
    func testUnsuccessfulAuthorization() {
        // Test data
        let wrongEmail = appHelper.randomString(length: 10)
        let wrongPassword = appHelper.randomString(length: 15)
        
        let alertIsShown = loginScreen
            .invalidAuth(email: wrongEmail, pass: wrongPassword)
            .isWrongCredsAlertExists()

        XCTAssertTrue(alertIsShown,"‘Invalid credentials’ alert should be displayed")
    }
    
    func testSuccessfulRegister() {
        // Test data
        let firstName = "Yehor"
        let lastName = "Yehorychev"
        let email = "test@test.com"
        let pass = "testpass123"
        
        let user = UserReg(firstName: firstName, lastName: lastName, email: email, password: pass)
        let registerScreen = loginScreen.goToRegisterPage()
        
        registerScreen.setSubSwitcher(state: true)
        registerScreen.fillTheFields(userModel: user)
        registerScreen.clickOnRegister()
        appHelper.waitForAlertAndText(text: "Welcome!")
        
        let hasAlertDescription = appHelper.hasAlertDescription(text: "You are now registered")
        XCTAssertTrue(hasAlertDescription)
    }
}
