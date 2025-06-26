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
}
