//
//  GFAvatarImageView.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/16/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    let placeholderImage = Images.placeHolder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

