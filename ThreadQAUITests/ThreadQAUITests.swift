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
}
