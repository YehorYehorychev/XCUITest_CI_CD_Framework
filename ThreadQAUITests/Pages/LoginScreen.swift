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
    var email = "eve.holt@reqres.in"
    let password = "cityslicka"

    // Locators
    lazy var emailField = app.textFields["emailField"]
    lazy var passwordField = app.textFields["passField"]
    lazy var loginBtn = app.buttons["loginBtn"]
    lazy var registerBtn = app.buttons["newUserBtn"]
    
    // Methods
    func auth(email: String, pass: String) -> HomeScreen {
        emailField.tapAndType(text: email)
        passwordField.tapAndType(text: pass)
        
        loginBtn.tap()
        return HomeScreen()
    }
    
    func goToRegisterPage() -> RegisterScreen {
        registerBtn.tap()
        return RegisterScreen()
    }
}
