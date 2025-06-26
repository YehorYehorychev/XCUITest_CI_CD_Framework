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
}
