//
//  XCUIElement.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/24/25.
//

import Foundation
import XCTest

extension XCUIElement {
    
    func tapAndType(text: String) {
        self.tap()
        self.typeText(text)
    }
    
    func closeKeyboardIfExists() {
        let keyboard = app.keyboards.element(boundBy: 0)
        if keyboard.exists {
            let returnButton = app.buttons["Return"]
            if returnButton.exists {
                returnButton.tap()
            } else {
                app.tap()
            }
        }
    }
}
