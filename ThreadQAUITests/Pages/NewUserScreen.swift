//
//  NewUserScreen.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/26/25.
//

import Foundation
import XCTest

public class NewUserScreen {
    
    lazy var saveBtn = app.buttons["Save"]
    lazy var cancelBtn = app.buttons["Cancel"]
    lazy var firstNameField = app.textFields["firstName"]
    lazy var lastNameField = app.textFields["lastName"]
    lazy var emailField = app.textFields["email"]
    
    func fillFields(user: UserReg) -> HomeScreen {
        firstNameField.tapAndType(text: user.firstName)
        lastNameField.tapAndType(text: user.lastName)
        emailField.tapAndType(text: user.email)
        saveBtn.tap()
        return HomeScreen()
    }
}
