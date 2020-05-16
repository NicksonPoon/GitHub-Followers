//
//  User.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/15/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var htmlUrl: String
    var createdAt: String
    
    var name: String?
    var location: String?
    var bio: String?
    
    var following: Int
    var followers: Int
    var publicRepos: Int
    var publicGists: Int
    
}
