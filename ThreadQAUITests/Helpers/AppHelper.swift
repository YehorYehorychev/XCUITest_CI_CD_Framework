//
//  AppHelper.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/25/25.
//

import Foundation
import XCTest

class AppHelper {

    func randomString(length: Int) -> String {
        let letters =
            "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in letters.randomElement()! })
    }
    
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    func waitForAlertAndText(text: String) {
        let alert = app.alerts[text]
        waitForElement(element: alert)
    }
    
    func hasAlertDescription(text: String) -> Bool {
        return app.alerts.staticTexts[text].exists
    }
    
    func hideApp() {
        XCUIDevice.shared.press(XCUIDevice.Button.home)
    }
}
