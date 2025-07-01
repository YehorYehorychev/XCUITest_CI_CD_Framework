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
    
    func closeKeyboardIfExist() {
        if app.keyboards.element(boundBy: 0).exists {
            app.typeText("/n")
        }
    }
}
