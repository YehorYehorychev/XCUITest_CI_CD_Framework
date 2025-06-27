//
//  UserReqres.swift
//  ThreadQAUITests
//
//  Created by Yehor Yehorychev on 6/27/25.
//

import Foundation
import UIKit

struct RequestModel: Decodable {
    let page: Int
    let data: [UserRequest]
}

struct UserRequest: Decodable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}
