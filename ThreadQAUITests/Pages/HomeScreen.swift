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
    
    func getImagesCound() -> Int {
        waitForElement(element: brainBtn)
        return app.images.count
    }
}
