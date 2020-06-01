//
//  ErrorMessage.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/15/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUsernmae = "Invalid username request."
    case unableToComplete = "Unable to complete your request. Please check your network connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "Data received from the server was invalid. Please try again."
    case unableToFavorite = "Ther was an error favoriting this user. Please try again"
    case alreadyFavored = "You've already favorited this user. You must really like them 😄"
}
