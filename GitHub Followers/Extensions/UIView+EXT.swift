//
//  UIView+EXT.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 6/11/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views{ addSubview(view) }
    }
    
}
