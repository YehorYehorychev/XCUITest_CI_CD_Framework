//
//  UserDetailScreen.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/27/25.
//

import Foundation
import XCTest

class UserDetailScreen {
    
    lazy var userNameText = app.staticTexts["usernameField"]
    lazy var emailText = app.staticTexts["emailField"]
    lazy var profileImage = app.images["profileImage"]
    lazy var cancelBtn = app.buttons["Cancel"]
    
    func getUserName() -> String {
        return userNameText.label
    }
    
    func getEmailField() -> String {
        return emailText.label
    }
    
    func isImageExist() -> Bool {
        return profileImage.exists
    }
}
