//
//  HomeDataProviderProtocol.swift
//  Generic Network Layer
//
//  Created by Hüseyin BAKAR on 7.01.2024.
//

import UIKit

protocol HomeDataProviderProtocol {
    func fetchUser(with endpoint: Endpoint, completion: @escaping(Result<[User]?,Error>) ->())
    func fetchComment(with endpoint: Endpoint, completion: @escaping(Result<[Comment]?,Error>) ->())
    func post(with endpoint: Endpoint, completion: @escaping(Result<Post?,Error>) ->())
}
