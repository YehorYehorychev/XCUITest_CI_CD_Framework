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
}
