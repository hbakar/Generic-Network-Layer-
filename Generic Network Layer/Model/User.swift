//
//  User.swift
//  Generic Network Layer
//
//  Created by Hüseyin BAKAR on 7.01.2024.
//

import Foundation

struct User: Decodable {
    let name: String?
    let userName: String?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case userName = "username"
        case email
    }
}
