//
//  FavoriteCell.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 6/6/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    static let reuseID = "FavoriteCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlign: .left, fontSize: 26)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    
    func setFavorite(favorite: Follower) {
        usernameLabel.text = favorite.login
        avatarImageView.downloadImage(from: favorite.avatarUrl)
    }

    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        accessoryType = .disclosureIndicator
        let padding:CGFloat = 12
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding * 2),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
