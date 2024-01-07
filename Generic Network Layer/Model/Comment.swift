//
//  Comment.swift
//  Generic Network Layer
//
//  Created by Hüseyin BAKAR on 7.01.2024.
//

import Foundation

struct Comment: Decodable {
    let postID, id: Int?
    let name, email, body: String?
    
    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias commentArray = [Comment]
