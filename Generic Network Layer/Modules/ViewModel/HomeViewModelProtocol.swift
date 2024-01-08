//
//  HomeViewModelProtocol.swift
//  Generic Network Layer
//
//  Created by Hüseyin BAKAR on 7.01.2024.
//

import Foundation

protocol HomeViewModelProtocol {
    
    var delegate: HomeViewModelDelegate? {get set}

    var userList: [User]? {get set}
    
    var commentList: [Comment]? {get set}
    
    var postResponse: Post? {get set}
    
    func fetchUser(with url: Endpoint)
    
    func fetchComments(with url: Endpoint)
    
    func post(with url: Endpoint)
}
