//
//  User.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/15/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let createdAt: String
    
    let name: String?
    let location: String?
    let bio: String?
    
    let following: Int
    let followers: Int
    let publicRepos: Int
    let publicGists: Int
    
}
