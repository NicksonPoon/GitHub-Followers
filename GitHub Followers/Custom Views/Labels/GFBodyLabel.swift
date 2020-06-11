//
//  GFBodyLabel.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/15/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import UIKit

class GFBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    convenience init(textAlign: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlign
    }
    
    
    private func configure() {
        font = UIFont.preferredFont(forTextStyle: .body)
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
