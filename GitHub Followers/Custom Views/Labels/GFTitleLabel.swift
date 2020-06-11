//
//  GFTitleLabel.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/15/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import UIKit

class GFTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    convenience init(textAlign: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlign
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)

    }
    
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        baselineAdjustment = .alignCenters
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
