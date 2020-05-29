//
//  GFFollowerVC.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/28/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//


import Foundation

class GFFollowerVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        
        actionButton.set(backgroundColor: .systemGreen , title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}


