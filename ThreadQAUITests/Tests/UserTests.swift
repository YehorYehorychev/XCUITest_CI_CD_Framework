//
//  UserTests.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/26/25.
//

import Foundation
import XCTest

final class UserTests: XCTestCase {
    private var loginScreen = LoginScreen()
    private var homeScreen: HomeScreen!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        
        let email = "eve.holt@reqres.in"
        let password = "cityslicka"

        homeScreen = loginScreen.auth(email: email, pass: password)
    }
    
    func testUserInfo() {
        let profileScreen = homeScreen.openProfile()
        
        let userEmail = profileScreen.getEmail()
        let userFirstName = profileScreen.getName()
        let userLastName = profileScreen.getLastName()
        let userHasImage = profileScreen.isImageExist()
        
        XCTAssertEqual(userEmail, "janet.weaver@reqres.in")
        XCTAssertEqual(userFirstName, "Janet")
        XCTAssertEqual(userLastName, "Weaver")
        XCTAssertTrue(userHasImage)
    }
    
    func testLogOut() {
        let isLoggedOut = homeScreen.logOut().isLoginScreen()
        XCTAssertTrue(isLoggedOut)
    }
}
