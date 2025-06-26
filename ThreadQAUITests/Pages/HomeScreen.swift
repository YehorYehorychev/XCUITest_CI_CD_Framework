//
//  HomeScreen.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/24/25.
//

import Foundation
import XCTest

public class HomeScreen {
    
    lazy var brainBtn = app.buttons["Profile"]
    lazy var logoutBtn = app.buttons["LogOut"]
    lazy var addUserBtn = app.buttons["Add"]
    lazy var users = app.staticTexts
    
    func getImagesCound() -> Int {
        waitForElement(element: brainBtn)
        return app.images.count
    }
    
    func openProfile() -> ProfileScreen {
        waitForElement(element: brainBtn).tap()
        return ProfileScreen()
    }
    
    func logOut() -> LoginScreen {
        waitForElement(element: logoutBtn).tap()
        return LoginScreen()
    }
    
    func addNewUser() -> NewUserScreen {
        waitForElement(element: addUserBtn).tap()
        return NewUserScreen()
    }
    
    func openUser(textOrEmail: String) -> ProfileScreen {
        let user = users[textOrEmail]
        waitForElement(element: user).tap()
        return ProfileScreen()
    }
}
