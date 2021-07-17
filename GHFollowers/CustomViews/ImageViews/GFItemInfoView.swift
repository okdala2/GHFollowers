//
//  GFItemInfoView.swift
//  GHFollowers
//
//  Created by Dala  on 7/3/21.
//

import UIKit

class GFItemInfoView: UIView {
    
    let symbolImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontsize: 14)
    let countLabel = GFTitleLabel(textAlignment: .left, fontsize: 14)
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(infoType: ItemInfoType, with count: Int) {
        switch infoType {
        case .repos:
            symbolImageView.image = SFSymbols.repos
            titleLabel.text = "Public Repos"
            break
            
        case .gists:
            symbolImageView.image = SFSymbols.gists
            titleLabel.text = "Gists"
            break

        case .followers:
            symbolImageView.image = SFSymbols.followers
            titleLabel.text = "Followers"
            break

        case .following:
            symbolImageView.image = SFSymbols.following
            titleLabel.text = "Following"
            break
        }
        countLabel.text = String(count)
    }
    
    
    private func configure() {
        
        addsubviews(symbolImageView, countLabel, titleLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFit
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
}

enum ItemInfoType {
    case repos
    case gists
    case followers
    case following
}
