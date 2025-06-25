//
//  LoginScreen.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/24/25.
//

import Foundation
import XCTest

public class LoginScreen {
    // Test data
    let email = "eve.holt@reqres.in"
    let password = "cityslicka"

    // Locators -> Login page
    lazy var emailField = app.textFields["emailField"]
    lazy var passwordField = app.textFields["passField"]
    lazy var loginBtn = app.buttons["loginBtn"]
}
