//
//  HomeViewController.swift
//  Generic Network Layer
//
//  Created by Hüseyin BAKAR on 7.01.2024.
//

import UIKit

final class HomeViewController: UIViewController {

    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.delegate = self
        
        let endpoint = Endpoint.getUsers
        viewModel?.fetchUser(with: endpoint)
        
        let endpoint2 = Endpoint.comments(postID: "1")
        viewModel?.fetchComments(with: endpoint2)
        
        let endpoint3 = Endpoint.posts(title: "title1", body: "body1", userID: 1)
        viewModel?.post(with: endpoint3)
    }
}

extension HomeViewController: HomeViewModelDelegate {
   
    func notify(_ event: HomeViewModelEvents) {
        switch event {
        case .didFetchUserList:
            DispatchQueue.main.async {
                print(self.viewModel?.userList!)
            }
        case .fetchFailed(let error):
            print(error.localizedDescription)
        case .didFetchCommentList:
            DispatchQueue.main.async {
                print(self.viewModel?.commentList!)
            }
        case .fetchFailedComment(let error):
            print(error.localizedDescription)
        case .didPost:
            print(viewModel?.postResponse)
        case .postFailed(let error):
            print(error.localizedDescription)
        }
    }
    
    
}
