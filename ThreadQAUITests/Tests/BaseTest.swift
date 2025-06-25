//
//  BaseTest.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/24/25.
//

import Foundation
import XCTest

// BaseTest it's not a class, it's just a SwiftFile,
// that contains a global XCUIApplication variable
let app = XCUIApplication()

func waitForElement(element: XCUIElement) -> XCUIElement {
    if !element.waitForExistence(timeout: 8) {
        XCTFail("Element not found: \(element.description)")
    }
    return element
}
