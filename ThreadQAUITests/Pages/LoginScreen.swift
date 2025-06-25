//
//  LoginScreen.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/24/25.
//

import Foundation
import XCTest

public class LoginScreen {
    // Locators
    lazy var emailField = app.textFields["emailField"]
    lazy var passwordField = app.textFields["passField"]
    lazy var loginBtn = app.buttons["loginBtn"]
    lazy var registerBtn = app.buttons["newUserBtn"]
    lazy var alertWindow = app.alerts["Try Again"]
    lazy var invalidCredsAlert = app.alerts.staticTexts["Invalid credentials"]
    
    // Methods
    func auth(email: String, pass: String) -> HomeScreen {
        emailField.tapAndType(text: email)
        passwordField.tapAndType(text: pass)
        
        loginBtn.tap()
        return HomeScreen()
    }
    
    func invalidAuth(email: String, pass: String) -> LoginScreen {
        emailField.tapAndType(text: email)
        passwordField.tapAndType(text: pass)
        
        loginBtn.tap()
        return LoginScreen()
    }
    
    func goToRegisterPage() -> RegisterScreen {
        registerBtn.tap()
        return RegisterScreen()
    }
    
    func isLoginScreen() -> Bool {
        return loginBtn.exists
    }
    
    func isWrongCredsAlertExists() -> Bool {
        _ = waitForElement(element: alertWindow)
        return invalidCredsAlert.exists
    }
}
