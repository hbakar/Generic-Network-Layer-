//
//  Post.swift
//  Generic Network Layer
//
//  Created by Hüseyin BAKAR on 7.01.2024.
//

import Foundation

struct Post: Codable {
    let id: Int?
    let title: String?
    let body: String?
    let userId: Int?
}
