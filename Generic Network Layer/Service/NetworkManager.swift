//
//  NetworkManager.swift
//  Generic Network Layer
//
//  Created by Hüseyin BAKAR on 7.01.2024.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    func fetchRequest<T: Decodable>(_ endpoint: Endpoint, completion: @escaping(Result<T, Error>) ->()) {
        
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(T.self, from: data)
                    completion(.success(response))
                }
                catch {
                    completion(.failure(error))
                }
            }
            else {
                completion(.failure(NSError(domain: "No data returned", code: 0)))
                return
            }
        }
        task.resume()
    }
    
    
}
