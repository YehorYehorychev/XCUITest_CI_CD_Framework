//
//  ThreadQAUITests.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/20/25.
//

import XCTest

final class ThreadQAUITests: XCTestCase {
    private var loginScreen = LoginScreen()

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

        let imagesCount = loginScreen
            .auth(email: email, pass: password)
            .getImagesCound()
        
        XCTAssertEqual(6, imagesCount)
    }
    
    func testUnsuccessfulAuthorization() {
        app.launch()
        
        // Test data
        let wrongEmail = "test@mail.com"
        let wrongPassword = "test4u"
        
        let alertIsShown = loginScreen
            .invalidAuth(email: wrongEmail, pass: wrongPassword)
            .isWrongCredsAlertExists()

        XCTAssertTrue(alertIsShown,"‘Invalid credentials’ alert should be displayed")
    }
    
    func testSuccessfulRegister() {
        app.launch()
        
        // Test data
        let firstName = "Yehor"
        let lastName = "Yehorychev"
        let email = "test@test.com"
        let pass = "testpass123"
        
        var user = UserReg(firstName: firstName, lastName: lastName, email: email, password: pass)
        let registerScreen = loginScreen.goToRegisterPage()
        
        registerScreen.setSubSwitcher(state: true)
        registerScreen.fillTheFields(userModel: user)
        registerScreen.clickOnRegister()
    }
}
