//
//  HomeViewModel.swift
//  Generic Network Layer
//
//  Created by Hüseyin BAKAR on 7.01.2024.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
   
    var userList: [User]?
    
    var commentList: [Comment]?
    
    var postResponse: Post?
    
    weak var delegate: HomeViewModelDelegate?
    
    private let service: HomeDataProviderProtocol
    
    init(service: HomeDataProviderProtocol) {
        self.service = service
    }
    
    func fetchComments(with url: Endpoint) {
        service.fetchComment(with: url) { [weak self] results in
            switch results {
            case .success(let success):
                self?.commentList = success
                self?.delegate?.notify(.didFetchCommentList)
            case .failure(let failure):
                self?.delegate?.notify(.fetchFailedComment(failure))
            }
        }
    }
    
    func fetchUser(with url: Endpoint) {
        service.fetchUser(with: url) { [weak self] results in
            switch results {
            case .success(let success):
                self?.userList = success
                self?.delegate?.notify(.didFetchUserList)
            case .failure(let failure):
                self?.delegate?.notify(.fetchFailed(failure))
            }
        }
    }
    
    func post(with url: Endpoint) {
        service.post(with: url) { [weak self] results in
            switch results {
            case .success(let success):
                self?.postResponse = success
                self?.delegate?.notify(.didPost)
            case .failure(let error):
                self?.delegate?.notify(.postFailed(error))
            }
        }
    }
}

protocol HomeViewModelDelegate: AnyObject {
    func notify(_ event: HomeViewModelEvents)
}

enum HomeViewModelEvents {
    case didFetchUserList
    case fetchFailed(Error)
    case didFetchCommentList
    case fetchFailedComment(Error)
    case didPost
    case postFailed(Error)
}
