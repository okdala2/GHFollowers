//
//  User.swift
//  GHFollowers
//
//  Created by Dala  on 7/1/21.
//

import Foundation

struct User: Codable {
    
    let login: String
    let avatarURL: String
    var name: String?
    var location:String?
    var bio: String?
    let pubicRepos: Int
    let publicGists: Int
    let following: Int
    let followers: Int
    let htmlURL: String
    let createdAt: String
    
}
