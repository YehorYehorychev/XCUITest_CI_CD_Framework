//
//  ProfileScreen.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/26/25.
//

import Foundation
import XCTest

public class ProfileScreen {
    
    lazy var nameText = app.staticTexts["name"]
    lazy var lastNameText = app.staticTexts["lastname"]
    lazy var emailText = app.staticTexts["email"]
    lazy var profileImage = app.images["profileImage"]
    lazy var cancelBtn = app.buttons["Cancel"]
    
    func getName() -> String {
        return nameText.label
    }
    
    func getLastName() -> String {
        return lastNameText.label
    }
    
    func getEmail() -> String {
        return emailText.label
    }
    
    func isImageExist() -> Bool {
        return profileImage.exists
    }
    
    func goBack() -> HomeScreen {
        cancelBtn.tap()
        return HomeScreen()
    }
}
