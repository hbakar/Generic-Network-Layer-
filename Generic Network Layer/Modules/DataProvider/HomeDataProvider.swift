//
//  HomeDataProvider.swift
//  Generic Network Layer
//
//  Created by Hüseyin BAKAR on 7.01.2024.
//

import Foundation

final class HomeDataProvider: HomeDataProviderProtocol {
    
    func post(with endpoint: Endpoint, completion: @escaping (Result<Post?, Error>) -> ()) {
        NetworkManager.shared.fetchRequest(endpoint, completion: completion)
    }
    
    func fetchComment(with endpoint: Endpoint, completion: @escaping (Result<[Comment]?, Error>) -> ()) {
        NetworkManager.shared.fetchRequest(endpoint, completion: completion)
    }
 
    
    func fetchUser(with endpoint: Endpoint, completion: @escaping (Result<[User]?, Error>) -> ()) {
        NetworkManager.shared.fetchRequest(endpoint, completion: completion)
    }
}
