//
//  User.swift
//  GHFollowers
//
//  Created by Dala  on 7/1/21.
//

import Foundation

struct User: Codable {
    
    var login: String
    var avatarURL: String
    var name: String?
    var location:String?
    var bio: String?
    var pubicRepos: Int
    var publicGists: Int
    var following: Int
    var followers: Int
    var htmlURL: String
    var createdAt: String
    
}
