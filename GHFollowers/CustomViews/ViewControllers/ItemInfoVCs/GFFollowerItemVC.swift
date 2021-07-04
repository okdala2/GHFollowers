//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Dala  on 7/3/21.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(infoType: .followers, with: user.followers ?? 0)
        itemInfoViewTwo.set(infoType: .following, with: user.following ?? 0)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        self.delegate.didTapGetFollowers(for: user)
    }
}
