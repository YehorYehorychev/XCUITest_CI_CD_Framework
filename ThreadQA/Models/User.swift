import Foundation
import UIKit
class User: Decodable {
    let id: Int
    var first_name: String
    var last_name: String
    var avatar: String
    var email: String
    var photo: Data?
    
    init(image: String, first: String, last: String, myEmail: String){
        first_name = first
        last_name = last
        avatar = image
        email = myEmail
        
        id = 12
    }
    enum CodingKeys: String, CodingKey{
        case id
        case email
        case first_name = "first_name"
        case last_name = "last_name"
        case avatar = "avatar"
    }
}

class Result: Decodable {
    let total: Int
    let data: [User]
}

class Result2: Decodable {
    let data: User
}
