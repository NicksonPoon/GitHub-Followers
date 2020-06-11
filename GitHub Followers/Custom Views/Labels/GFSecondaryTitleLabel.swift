//
//  GFSecondaryTitleLabel.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/23/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {

      override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
    }
    
    private func configure() {
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byWordWrapping
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
