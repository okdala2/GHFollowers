//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Dala  on 6/30/21.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
            
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Eh, didn't work", message: errorMessage!, buttonTitle: "Ok")
                return
            }
            
            print("Followers = \(followers.count)")
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)

    }
}
