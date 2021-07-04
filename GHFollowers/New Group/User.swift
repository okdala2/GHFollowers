//
//  User.swift
//  GHFollowers
//
//  Created by Dala  on 7/1/21.
//

import Foundation

struct User: Codable {
    
    var login: String?
    var avatar_url: String?
    var name: String?
    var location: String?
    var bio: String?
    var public_repos: Int?
    var public_gists: Int?
    var followers: Int?
    var following: Int?
    var html_url: String?
    var created_at: String?
}

