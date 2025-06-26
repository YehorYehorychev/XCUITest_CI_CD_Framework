//
//  RegisterScreen.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/24/25.
//

import Foundation
import XCTest

public class RegisterScreen {
    
    lazy var firstNameField = app.textFields["firstNameField"]
    lazy var lastNameField = app.textFields["lastNameField"]
    lazy var emailField = app.textFields["emailField"]
    lazy var passField = app.textFields["passField"]
    lazy var subSwitcher = app.switches["subSwitcher"]
    
    lazy var backBtn = app.buttons["loginBackBtn"]
    lazy var registerBtn = app.buttons["registerBtn"]
    lazy var keyboardReturnBtn = app.keyboards.buttons["Return"]
    
    func setSubSwitcher(state: Bool) {
        let value = subSwitcher.value as? String
        if (value == "0" && state) {
            subSwitcher.tap()
            return
        }
        
        if (value == "1" && !state) {
            subSwitcher.tap()
            return
        }
    }
    
    func fillTheFields(userModel: UserReg) {
        firstNameField.tapAndType(text: userModel.firstName)
        lastNameField.tapAndType(text: userModel.lastName)
        emailField.tapAndType(text: userModel.email)
        passField.tapAndType(text: userModel.password)
        keyboardReturnBtn.tap()
    }
    
    func clickOnRegister() {
        registerBtn.tap()
    }
}
