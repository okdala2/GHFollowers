//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Dala  on 7/3/21.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(infoType: .repos, with: user.pubicRepos ?? 0)
        itemInfoViewTwo.set(infoType: .gists, with: user.publicGists ?? 0)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func actionButtonTapped() {
        self.delegate.didTapGithubProfile(for: user)
    }
}
